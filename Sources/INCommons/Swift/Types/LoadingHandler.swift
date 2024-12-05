/// Responsible for calling any concurrency loading methods on the `CalendarManager`
/// to prevent race conditions.
actor LoadingHandler {
	/// A queue of actions for being executed in sequence.
	private var actionQueue = [@Sendable () async -> Void]()
	/// The task currently executed.
	private var currentTask: Task<Void, Never>?

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
		Task {
			await addAction(action)
		}
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

	/// Cleans up the task reference and processes the next action in queue.
	private func cleanUpTask() {
		currentTask = nil
		executeNextAction()
	}
}
