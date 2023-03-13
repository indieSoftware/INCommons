import INCommons
import XCTest

class StringEmptyTests: XCTestCase {
	func testEmptyStringIsEmpty() throws {
		let result = String.empty
		XCTAssertEqual("", result)
	}
}
