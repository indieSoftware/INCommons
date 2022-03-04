import INCommons
import SwiftUI
import XCTest

class DispatchQueueTests: XCTestCase {
	func testDispatchOnceCalled() {
		let token = #function
		let calledExpectation = expectation(description: "calledExpectation")
		DispatchQueue.once(token: token, block: {
			calledExpectation.fulfill()
		})

		waitForExpectations(timeout: 1)
	}

	func testDispatchOnceDoesNotFireTwice() {
		let token = #function
		let calledExpectation = expectation(description: "calledExpectation")
		DispatchQueue.once(token: token, block: {
			calledExpectation.fulfill()
		})
		waitForExpectations(timeout: 1)

		DispatchQueue.once(token: token, block: {
			XCTFail()
		})
	}
}
