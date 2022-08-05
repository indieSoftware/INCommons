import INCommons
import XCTest

final class UIColorTests: XCTestCase {
	func testRandomColor() {
		let color1 = UIColor.random
		let color2 = UIColor.random
		XCTAssertNotEqual(color1, color2)
	}

	func test6CharHexInit() throws {
		let color = try XCTUnwrap(UIColor(hex: "FF003D"))
		let rgbaValues = try XCTUnwrap(color.rgbaColor)
		XCTAssertEqual(rgbaValues.red, 1.0)
		XCTAssertEqual(rgbaValues.green, 0.0)
		XCTAssertEqual(rgbaValues.blue, 0x3D / 0xFF)
		XCTAssertEqual(rgbaValues.alpha, 1.0)
	}

	func test8CharHexInit() throws {
		let color = try XCTUnwrap(UIColor(hex: "12DEFF7F"))
		let rgbaValues = try XCTUnwrap(color.rgbaColor)
		XCTAssertEqual(rgbaValues.red, 0x12 / 0xFF)
		XCTAssertEqual(rgbaValues.green, 0xDE / 0xFF)
		XCTAssertEqual(rgbaValues.blue, 0xFF / 0xFF)
		XCTAssertEqual(rgbaValues.alpha, 0x7F / 0xFF)
	}

	func testHexInit() {
		XCTAssertNil(UIColor(hex: ""))
		XCTAssertNil(UIColor(hex: "1"))
		XCTAssertNil(UIColor(hex: "12"))
		XCTAssertNil(UIColor(hex: "12D"))
		XCTAssertNil(UIColor(hex: "12DE"))
		XCTAssertNil(UIColor(hex: "12DEF"))
		XCTAssertNotNil(UIColor(hex: "12DEFF"))
		XCTAssertNil(UIColor(hex: "12DEFF7"))
		XCTAssertNotNil(UIColor(hex: "12DEFF7F"))
		XCTAssertNil(UIColor(hex: "12DEFF7FF"))
		XCTAssertNil(UIColor(hex: "12DEFF7FF3"))
		XCTAssertNil(UIColor(hex: "12DEFF7FF3D"))
	}

	func testRgbaColor() {
		let rgba = UIColor.RgbaColor(red: 0.2, green: 0.5, blue: 1.0)
		let color = UIColor(rgba: rgba)
		let result = color.rgbaColor
		XCTAssertEqual(result?.red, 0.2)
		XCTAssertEqual(result?.green, 0.5)
		XCTAssertEqual(result?.blue, 1.0)
		XCTAssertEqual(result?.alpha, 1.0)
	}
}
