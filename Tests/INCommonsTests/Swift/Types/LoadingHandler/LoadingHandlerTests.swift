import INCommons
import XCTest

final class LoadingHandlerTests: XCTestCase {
	private var loadingHandler: LoadingHandler!
	private var executionOrder: [Int]!

	override func setUp() {
		super.setUp()
		loadingHandler = LoadingHandler()
		executionOrder = []
	}

	override func tearDown() {
		loadingHandler = nil
		executionOrder = nil
		super.tearDown()
	}

	/// Tests that actions are executed sequentially.
	func testActionsExecuteSequentially() async {
		let expectation = XCTestExpectation(description: "All actions should execute in sequence")

		// Add multiple actions to the handler
		await loadingHandler.addAction {
			self.executionOrder.append(1)
			try? await Task.sleep(nanoseconds: 100_000_000) // Simulate delay (0.1s)
		}
		await loadingHandler.addAction {
			self.executionOrder.append(2)
			try? await Task.sleep(nanoseconds: 50_000_000) // Simulate delay (0.05s)
		}
		await loadingHandler.addAction {
			self.executionOrder.append(3)
		}

		// Wait for actions to complete
		await waitUntilQueueIsEmpty()

		// Verify the execution order
		XCTAssertEqual(executionOrder, [1, 2, 3], "Actions did not execute sequentially.")
		expectation.fulfill()
		await fulfillment(of: [expectation], timeout: 1)
	}

	/// Tests that the task queue processes actions automatically when added using `spawnTaskToAddAction`.
	func testSpawnTaskToAddAction() async {
		let expectation = XCTestExpectation(description: "Actions added using spawnTaskToAddAction should execute sequentially")

		// Add actions using spawnTaskToAddAction
		loadingHandler.spawnTaskToAddAction {
			self.executionOrder.append(1)
			try? await Task.sleep(nanoseconds: 50_000_000) // Simulate delay
		}
		loadingHandler.spawnTaskToAddAction {
			self.executionOrder.append(2)
		}

		// Wait for actions to complete
		await waitUntilQueueIsEmpty()

		// Verify the execution order
		XCTAssertEqual(executionOrder, [1, 2], "Actions did not execute sequentially when added via spawnTaskToAddAction.")
		expectation.fulfill()
		await fulfillment(of: [expectation], timeout: 1)
	}

	/// Tests that adding no actions does not cause unexpected execution.
	func testEmptyQueue() async {
		let expectation = XCTestExpectation(description: "No actions should execute with an empty queue")

		// Nothing is added to the action queue
		await waitUntilQueueIsEmpty()

		// Verify no action was executed
		XCTAssertTrue(executionOrder.isEmpty, "Queue executed actions when it was expected to remain empty.")
		expectation.fulfill()
		await fulfillment(of: [expectation], timeout: 1)
	}

	/// Tests that multiple concurrent calls to `spawnTaskToAddAction` do not cause race conditions.
	func testConcurrentActionAddition() async {
		let expectation = XCTestExpectation(description: "Concurrent action additions should execute sequentially")

		// Add actions concurrently
		let group = DispatchGroup()
		for i in 1 ... 5 {
			group.enter()
			Task {
				loadingHandler.spawnTaskToAddAction {
					self.executionOrder.append(i)
					try? await Task.sleep(nanoseconds: 20_000_000) // Simulate slight delay
					group.leave()
				}
			}
		}

		group.wait()
		await waitUntilQueueIsEmpty()

		// Verify all actions executed sequentially
		XCTAssertEqual(executionOrder, [1, 2, 3, 4, 5], "Concurrent additions did not execute sequentially.")
		expectation.fulfill()
		await fulfillment(of: [expectation], timeout: 2)
	}

	// MARK: - Helper Methods

	/// Waits for the queue to be empty.
	private func waitUntilQueueIsEmpty() async {
		try? await Task.sleep(nanoseconds: 200_000_000) // Wait briefly to ensure all tasks are complete
	}
}
