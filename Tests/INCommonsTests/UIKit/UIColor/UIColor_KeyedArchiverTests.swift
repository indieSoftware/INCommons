import INCommons
import XCTest

final class UIColor_KeyedArchiverTests: XCTestCase {
	func testArchiver() throws {
		let rgba = UIColor.RgbaColor(red: 0.2, green: 1.0, blue: 0.8, alpha: 0.5)
		let color = UIColor(rgba: rgba)
		let data = try XCTUnwrap(color.asData())
		let uiColor = try XCTUnwrap(data.asUIColor())
		let rgbaResult = try XCTUnwrap(uiColor.rgbaColor)
		XCTAssertEqual(rgbaResult.red, 0.2)
		XCTAssertEqual(rgbaResult.green, 1.0)
		XCTAssertEqual(rgbaResult.blue, 0.8)
		XCTAssertEqual(rgbaResult.alpha, 0.5)
	}
}
