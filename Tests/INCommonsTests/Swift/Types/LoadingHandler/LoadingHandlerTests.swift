import INCommons
import XCTest

@MainActor
final class LoadingHandlerTests: XCTestCase, @unchecked Sendable {
	private var sut: LoadingHandler!

	override func setUp() async throws {
		try await super.setUp()
		sut = LoadingHandler()
	}

	override func tearDown() async throws {
		sut = nil
		try await super.tearDown()
	}

	func test_addingActionToEmptyQueueExecutesAction() async {
		let actionExpectation = expectation(description: "actionExpectation")
		await sut.addAction {
			actionExpectation.fulfill()
		}
		await fulfillment(of: [actionExpectation], timeout: 1.0)
	}

	func test_addingActionsPerformsThemInSequence() async {
		let firstActionBlockedExpectation = expectation(description: "firstActionBlockedExpectation")
		let mainActionsEnqueuedExpectation = expectation(description: "mainActionsEnqueuedExpectation")
		await sut.addAction {
			// Inform the test that this action has been started.
			firstActionBlockedExpectation.fulfill()
			// Wait for the test to enqueue the other actions before finishing this set up action.
			await self.fulfillment(of: [mainActionsEnqueuedExpectation], timeout: 1.0)
		}
		// It's not defined whether the action gets immediately executed or delayed,
		// therefore, we are waiting for setUpStartedExpectation to ensure the
		// action has been started, but is now waiting for the test to continue.
		await fulfillment(of: [firstActionBlockedExpectation], timeout: 1.0)

		// Enqueue some "real" actions.
		let action1Expectation = expectation(description: "action1Expectation")
		await sut.addAction {
			action1Expectation.fulfill()
		}
		// The first action has to be executed before the second one.
		let action2Expectation = expectation(description: "action2Expectation")
		await sut.addAction {
			await self.fulfillment(of: [action1Expectation], timeout: 1.0)
			action2Expectation.fulfill()
		}
		// This is just another action but gets enqueued with a different method.
		let action3Expectation = expectation(description: "action3Expectation")
		sut.spawnTaskToAddAction {
			action3Expectation.fulfill()
		}

		// Inform the first action that everything has been prepared to proceed with the real test.
		mainActionsEnqueuedExpectation.fulfill()

		// Now wait for the first action to be finished.
		await fulfillment(of: [action2Expectation, action3Expectation], timeout: 1.0)
	}
}
