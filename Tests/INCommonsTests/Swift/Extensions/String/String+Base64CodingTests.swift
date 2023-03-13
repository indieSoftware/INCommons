import INCommons
import XCTest

class String_Base64CodingTests: XCTestCase {
	func testBase64Encoded() {
		let result = "FooBar".base64Encoded
		XCTAssertEqual(result, "Rm9vQmFy")
	}

	func testBase64Decoded() {
		let result = "Rm9vQmFy".base64Decoded
		XCTAssertEqual(result, "FooBar")
	}
}
