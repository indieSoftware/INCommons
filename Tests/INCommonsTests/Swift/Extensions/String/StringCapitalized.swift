import XCTest

class StringFirstUppercased: XCTestCase {
	func testSwiftCapitalizedLowercasesWordAndUppercaseEachFirstCharacterOfEachWord() throws {
		let testString = "lowerCased words"
		let result = testString.capitalized
		XCTAssertEqual("Lowercased Words", result)
	}

	func testFirstCapitalizedOnLowercaseStrings() throws {
		let testString = "lowerCased words"
		let result = testString.firstCapitalized
		XCTAssertEqual("LowerCased words", result)
	}

	func testFirstUppercasedOnLowercaseStrings() throws {
		let testString = "lowerCased words"
		let result = testString.firstUppercased
		XCTAssertEqual("LowerCased words", result)
	}

	func testFirstCapitalizedOnMultiCharacterUnicode() throws {
		let testString = "ǆ"
		let result = testString.firstCapitalized
		XCTAssertEqual("ǅ", result)
	}

	func testFirstUppercasedOnMultiCharacterUnicode() throws {
		let testString = "ǆ"
		let result = testString.firstUppercased
		XCTAssertEqual("Ǆ", result)
	}

	func testFirstCapitalizedOnSingleUnicode() throws {
		let testString = "œ"
		let result = testString.firstCapitalized
		XCTAssertEqual("Œ", result)
	}

	func testFirstUppercasedOnSingleUnicode() throws {
		let testString = "œ"
		let result = testString.firstUppercased
		XCTAssertEqual("Œ", result)
	}

	func testFirstCapitalizedOnNonCapitalizeLetter() throws {
		let testString = "ß"
		let result = testString.firstCapitalized
		XCTAssertEqual("Ss", result)
	}

	func testFirstUppercasedOnNonCapitalizeLetter() throws {
		let testString = "ß"
		let result = testString.firstUppercased
		XCTAssertEqual("SS", result)
	}
}
