import XCTest

class OptionalStringifiedTests: XCTestCase {
	func testStringIsReturned() throws {
		let optionalString: String? = "Foo"
		let result = optionalString.stringified()
		XCTAssertEqual("Foo", result)
	}

	func testEmptyStringIsReturned() throws {
		let optionalString: String? = ""
		let result = optionalString.stringified()
		XCTAssertEqual("", result)
	}

	func testDefaultFallbackIsReturnedWhenStringIsNil() throws {
		let optionalString: String? = nil
		let result = optionalString.stringified()
		XCTAssertEqual("", result)
	}

	func testCustomFallbackStringCanBeProvided() throws {
		let optionalString: String? = nil
		let result = optionalString.stringified("Fallback")
		XCTAssertEqual("Fallback", result)
	}

	func testNonStringOptionalStringified() throws {
		struct Foo: CustomStringConvertible {
			var description: String { "FOO" }
		}

		let foo: Foo? = Foo()
		let result = foo.stringified()
		XCTAssertEqual("FOO", result)
	}
}
