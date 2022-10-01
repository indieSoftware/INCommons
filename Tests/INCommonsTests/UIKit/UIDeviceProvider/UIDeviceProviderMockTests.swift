import INCommons
import XCTest

@MainActor
class UIDeviceProviderMockTests: XCTestCase {
	func testDefaultValues() throws {
		let deviceProvider = UIDeviceProviderMock()
		XCTAssertEqual(deviceProvider.userInterfaceIdiom, .phone)
		XCTAssertEqual(deviceProvider.deviceOrientation, .portrait)
	}

	func testUserInterfaceIdiomIsConfigurable() throws {
		let deviceProvider = UIDeviceProviderMock(interface: .pad)
		XCTAssertEqual(deviceProvider.userInterfaceIdiom, .pad)

		deviceProvider.userInterfaceIdiom = .tv
		XCTAssertEqual(deviceProvider.userInterfaceIdiom, .tv)
	}

	func testDeviceOrientationIsConfigurable() throws {
		let deviceProvider = UIDeviceProviderMock(orientation: .landscapeLeft)
		XCTAssertEqual(deviceProvider.deviceOrientation, .landscapeLeft)

		deviceProvider.deviceOrientation = .portraitUpsideDown
		XCTAssertEqual(deviceProvider.deviceOrientation, .portraitUpsideDown)
	}
}
