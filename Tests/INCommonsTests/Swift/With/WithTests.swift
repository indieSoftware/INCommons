import INCommons
import XCTest

class WithTests: XCTestCase {
	func testWithOnObject() {
		let result = with(WithObjectTester(value: 1)) {
			XCTAssertEqual(1, $0.value)
			$0.value = 2
			XCTAssertEqual(2, $0.value)
		}
		XCTAssertEqual(2, result.value)
	}

	func testWithOnStruct() {
		let result = with(WithStructTester(value: 1)) {
			XCTAssertEqual(1, $0.value)
			$0.value = 2
			XCTAssertEqual(2, $0.value)
		}
		XCTAssertEqual(2, result.value)
	}
}

// MARK: - Helper

private class WithObjectTester {
	var value: Int
	init(value: Int) {
		self.value = value
	}
}

private struct WithStructTester {
	var value: Int
}
