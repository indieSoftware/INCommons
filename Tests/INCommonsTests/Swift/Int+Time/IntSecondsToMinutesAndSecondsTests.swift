import INCommons
import XCTest

class IntSecondsToMinutesAndSecondsTests: XCTestCase {
	func testMinutesAndSeconds() {
		let seconds = 200
		let result = seconds.secondsToMinutesAndSeconds()
		XCTAssertEqual(3, result.minutes)
		XCTAssertEqual(20, result.seconds)
	}

	func testSecondsOnly() {
		let seconds = 30
		let result = seconds.secondsToMinutesAndSeconds()
		XCTAssertEqual(0, result.minutes)
		XCTAssertEqual(30, result.seconds)
	}

	func testZero() throws {
		let seconds = 0
		let result = seconds.secondsToMinutesAndSeconds()
		XCTAssertEqual(0, result.minutes)
		XCTAssertEqual(0, result.seconds)
	}

	func testNegativeMinutesAndSeconds() throws {
		let seconds = -200
		let result = seconds.secondsToMinutesAndSeconds()
		XCTAssertEqual(-3, result.minutes)
		XCTAssertEqual(-20, result.seconds)
	}

	func testHours() throws {
		let seconds = 4000
		let result = seconds.secondsToMinutesAndSeconds()
		XCTAssertEqual(66, result.minutes)
		XCTAssertEqual(40, result.seconds)
	}
}
