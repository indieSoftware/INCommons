import INCommons
import XCTest

final class Collection_SafeAccessTests: XCTestCase {
	func test_safeAccessExistingElementReturnsElement() {
		let array = ["Foo", "Bar"]
		let result = array[safe: 1]
		XCTAssertEqual(result, "Bar")
	}

	func test_safeAccessNonExistingElementReturnsNil() {
		let array = ["Foo", "Bar"]
		let result = array[safe: 2]
		XCTAssertNil(result)
	}
}
