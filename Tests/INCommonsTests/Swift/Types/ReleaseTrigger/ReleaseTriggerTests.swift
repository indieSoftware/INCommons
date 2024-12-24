import INCommons
import XCTest

@MainActor
final class ReleaseTriggerTests: XCTestCase {
	func testClosureGetsCalledOnDeinit() {
		let callbackExpectation = expectation(description: "callbackExpectation")
		var sut: ReleaseTrigger<Int>? = ReleaseTrigger<Int>(reference: 3) { reference in
			XCTAssertEqual(reference, 3)
			callbackExpectation.fulfill()
		}
		weak var weakSut = sut
		XCTAssertNotNil(weakSut)
		sut = nil
		XCTAssertNil(weakSut)
		waitForExpectations(timeout: 1)
	}
}
