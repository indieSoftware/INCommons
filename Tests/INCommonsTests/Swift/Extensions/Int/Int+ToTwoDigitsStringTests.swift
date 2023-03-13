import INCommons
import XCTest

class Int_ToTwoDigitsStringTests: XCTestCase {
	func testSingeDigit() {
		let value = 5
		let result = value.toTwoDigitsString()
		XCTAssertEqual("05", result)
	}

	func testTwoDigits() {
		let value = 15
		let result = value.toTwoDigitsString()
		XCTAssertEqual("15", result)
	}

	func testThreeDigit() {
		let value = 125
		let result = value.toTwoDigitsString()
		XCTAssertEqual("125", result)
	}

	func testZero() {
		let value = 0
		let result = value.toTwoDigitsString()
		XCTAssertEqual("00", result)
	}

	func testSingeNegativeDigit() {
		let value = -5
		let result = value.toTwoDigitsString()
		XCTAssertEqual("-05", result)
	}

	func testTwoNegativeDigits() {
		let value = -15
		let result = value.toTwoDigitsString()
		XCTAssertEqual("-15", result)
	}

	func testThreeNegativeDigit() {
		let value = -125
		let result = value.toTwoDigitsString()
		XCTAssertEqual("-125", result)
	}
}
