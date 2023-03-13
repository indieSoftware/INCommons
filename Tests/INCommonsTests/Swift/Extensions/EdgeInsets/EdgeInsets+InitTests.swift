import INCommons
import SwiftUI
import XCTest

class EdgeInsets_InitTests: XCTestCase {
	func test_zero() {
		let result = EdgeInsets.zero
		XCTAssertEqual(result.top, 0)
		XCTAssertEqual(result.bottom, 0)
		XCTAssertEqual(result.leading, 0)
		XCTAssertEqual(result.trailing, 0)
	}

	func test_initHorizontalVertical() {
		let result = EdgeInsets(horizontal: 12, vertical: 34)
		XCTAssertEqual(result.top, 34)
		XCTAssertEqual(result.bottom, 34)
		XCTAssertEqual(result.leading, 12)
		XCTAssertEqual(result.trailing, 12)
	}
}
