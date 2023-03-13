import INCommons
import XCTest

class StringTruncateTests: XCTestCase {
	func testTruncateLongString() throws {
		let value = "Commons"
		let result = value.truncated(numberOfCharacters: 3)
		XCTAssertEqual("Com", result)
	}

	func testTruncateShortString() throws {
		let value = "Commons"
		let result = value.truncated(numberOfCharacters: 10)
		XCTAssertEqual("Commons", result)
	}

	func testTruncateEmptyString() throws {
		let value = ""
		let result = value.truncated(numberOfCharacters: 3)
		XCTAssertEqual("", result)
	}

	func testTruncateFittingString() throws {
		let value = "Commons"
		let result = value.truncated(numberOfCharacters: 7)
		XCTAssertEqual("Commons", result)
	}

	func testTruncateNegativeLength() throws {
		let value = "Commons"
		let result = value.truncated(numberOfCharacters: -3)
		XCTAssertEqual("Commons", result)
	}

	func testTruncateZeroLength() throws {
		let value = "Commons"
		let result = value.truncated(numberOfCharacters: 0)
		XCTAssertEqual("", result)
	}
}
