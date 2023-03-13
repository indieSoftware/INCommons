import INCommons
import XCTest

class Double_TimeTests: XCTestCase {
	func testDispatchTimeInterval() {
		let seconds = 25.5
		let result = seconds.dispatchTimeInterval
		XCTAssertEqual(DispatchTimeInterval.milliseconds(Int(seconds * 1000.0)), result)
	}

	func testTimeInterval() {
		let seconds = 25.5
		let result = seconds.timeInterval
		XCTAssertEqual(TimeInterval(seconds), result)
	}
}
