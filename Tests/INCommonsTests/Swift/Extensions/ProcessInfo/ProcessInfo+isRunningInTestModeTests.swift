import INCommons
import XCTest

final class ProcessInfo_isRunningInTestModeTests: XCTestCase {
	func testIsRunningInTestModeReturnsTrue() {
		let result = ProcessInfo.isRunningInTestMode
		XCTAssertTrue(result, "'TestMode' argument not set for tests in the current scheme!")
	}
}
