import INCommons
import XCTest

class UIEdgeInsetsTests: XCTestCase {
	func testEdgeAccessors() throws {
		let edge = UIEdgeInsets(top: 25.0, left: 50.0, bottom: 75.0, right: 100.0)
		let resultTop = edge.top
		let resultLeft = edge.left
		let resultBottom = edge.bottom
		let resultRight = edge.right

		XCTAssertEqual(25.0, resultTop)
		XCTAssertEqual(50.0, resultLeft)
		XCTAssertEqual(75.0, resultBottom)
		XCTAssertEqual(100.0, resultRight)
	}

	func testChangeTop() throws {
		let edge = UIEdgeInsets(top: 25.0, left: 50.0, bottom: 75.0, right: 100.0)

		let result = edge.top(12)

		XCTAssertEqual(12.0, result.top)
		XCTAssertEqual(50.0, result.left)
		XCTAssertEqual(75.0, result.bottom)
		XCTAssertEqual(100.0, result.right)
	}

	func testChangeLeft() throws {
		let edge = UIEdgeInsets(top: 25.0, left: 50.0, bottom: 75.0, right: 100.0)

		let result = edge.left(21)

		XCTAssertEqual(25.0, result.top)
		XCTAssertEqual(21.0, result.left)
		XCTAssertEqual(75.0, result.bottom)
		XCTAssertEqual(100.0, result.right)
	}

	func testChangeBottom() throws {
		let edge = UIEdgeInsets(top: 25.0, left: 50.0, bottom: 75.0, right: 100.0)

		let result = edge.bottom(33)

		XCTAssertEqual(25.0, result.top)
		XCTAssertEqual(50.0, result.left)
		XCTAssertEqual(33.0, result.bottom)
		XCTAssertEqual(100.0, result.right)
	}

	func testChangeRight() throws {
		let edge = UIEdgeInsets(top: 25.0, left: 50.0, bottom: 75.0, right: 100.0)

		let result = edge.right(123.4)

		XCTAssertEqual(25.0, result.top)
		XCTAssertEqual(50.0, result.left)
		XCTAssertEqual(75.0, result.bottom)
		XCTAssertEqual(123.4, result.right)
	}
}
