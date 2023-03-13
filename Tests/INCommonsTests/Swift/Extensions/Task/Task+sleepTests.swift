import INCommons
import XCTest

class Task_sleepTests: XCTestCase {
	func testSleepInSeconds() throws {
		let secondsToWait = 1.5
		let sleepExpectation = expectation(description: "sleepExpectation")
		let startTime = DispatchTime.now()
		Task {
			try await Task.sleep(seconds: secondsToWait)
			sleepExpectation.fulfill()
		}

		waitForExpectations(timeout: 2)
		let endTime = DispatchTime.now()
		let elapsedSeconds = Double(endTime.uptimeNanoseconds - startTime.uptimeNanoseconds) / Double(1_000_000_000)
		XCTAssertGreaterThan(elapsedSeconds, 1.0)
		XCTAssertLessThan(elapsedSeconds, 2.0)
	}
}
