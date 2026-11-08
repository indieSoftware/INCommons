import os

/// `LoadingHandler` is designed to manage the execution of asynchronous tasks sequentially,
/// ensuring that no two tasks execute concurrently. This is particularly useful in scenarios where race
/// conditions might occur due to simultaneous access or modification of shared resources.
public actor LoadingHandler {
	/// A queue of actions for being executed in sequence.
	private var actionQueue = [@Sendable () async -> Void]()
	/// The task currently executed.
	private var currentTask: Task<Void, Never>?
	/// The number of actions passed to `spawnTaskToAddAction(_:)` whose task hasn't added them to the queue yet.
	///
	/// Increased synchronously when spawning, so `waitUntilIdle()` also waits for actions which aren't queued yet.
	private nonisolated let pendingSpawnedActionCount = OSAllocatedUnfairLock(initialState: 0)
	/// The callers of `waitUntilIdle()` waiting for the handler to become idle.
	private var idleContinuations = [CheckedContinuation<Void, Never>]()

	public init() {}

	/// Adds an action to the task queue for being executed on a background task.
	/// - parameter action: A closure to execute on a background task.
	public func addAction(_ action: @escaping @Sendable () async -> Void) {
		actionQueue.append(action)
		if currentTask == nil {
			executeNextAction()
		}
	}

	/// Spawns a new background task to add an action to the task queue.
	/// - parameter action: A closure to add to the action queue.
	public nonisolated func spawnTaskToAddAction(_ action: @escaping @Sendable () async -> Void) {
		pendingSpawnedActionCount.withLock { $0 += 1 }
		Task {
			await addSpawnedAction(action)
		}
	}

	/// Waits until the handler is idle: every action added so far has finished, including the actions passed to
	/// `spawnTaskToAddAction(_:)` which aren't queued yet and the actions added while waiting.
	///
	/// Returns immediately when nothing is queued or running.
	/// Useful to ensure that all work has been done before continuing, e.g. at the end of a test so no action keeps running
	/// into the next one.
	public func waitUntilIdle() async {
		guard !isIdle else { return }
		await withCheckedContinuation { continuation in
			idleContinuations.append(continuation)
		}
	}

	/// Whether no action is running, queued or about to be queued by a spawned task.
	private var isIdle: Bool {
		currentTask == nil && actionQueue.isEmpty && pendingSpawnedActionCount.withLock { $0 } == 0
	}

	/// Adds an action passed to `spawnTaskToAddAction(_:)` and counts it as no longer pending.
	/// - parameter action: The spawned action.
	private func addSpawnedAction(_ action: @escaping @Sendable () async -> Void) {
		pendingSpawnedActionCount.withLock { $0 -= 1 }
		addAction(action)
	}

	/// Runs the next action in a task if there is one.
	private func executeNextAction() {
		guard currentTask == nil else { return }
		guard !actionQueue.isEmpty else { return }
		let action = actionQueue.removeFirst()
		currentTask = Task.detached {
			await action()
			await self.cleanUpTask()
		}
	}

	/// Cleans up the task reference, processes the next action in queue and informs the waiting callers when the handler is idle.
	private func cleanUpTask() {
		currentTask = nil
		executeNextAction()
		resumeIdleContinuationsIfIdle()
	}

	/// Resumes all callers of `waitUntilIdle()` when the handler is idle.
	private func resumeIdleContinuationsIfIdle() {
		guard isIdle else { return }
		let continuations = idleContinuations
		idleContinuations.removeAll()
		for continuation in continuations {
			continuation.resume()
		}
	}
}
