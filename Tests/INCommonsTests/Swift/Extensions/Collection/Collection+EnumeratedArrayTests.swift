import INCommons
import XCTest

final class Collection_EnumeratedArrayTests: XCTestCase {
	func test_enumeratedArrayReturnsElements() {
		let array = ["Foo", "Bar"]
		let result = array.enumeratedArray()
		let expectedResult = [
			(0, "Foo"),
			(1, "Bar")
		]
		XCTAssertEqual(result.count, expectedResult.count)
		for (offset, element) in result {
			let expectedEntry = expectedResult[safe: offset]
			XCTAssertEqual(expectedEntry?.0, offset)
			XCTAssertEqual(expectedEntry?.1, element)
		}
	}
}
