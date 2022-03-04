import INCommons
import XCTest

class ConfigLoaderTests: XCTestCase {
	func testLoadSuccessful() {
		let result = ConfigLoader
			.parseConfig(named: "Config.plist", bundle: Bundle(for: ConfigLoaderTests.self)) as Result<ConfigModel, ConfigLoader.ConfigError>
		guard case let .success(data) = result else { XCTFail(); return }
		XCTAssertEqual("123", data.id)
		XCTAssertEqual(42, data.age)
		XCTAssertEqual("Foo", data.name)
		XCTAssertEqual("info@indie-software.com", data.email)
	}

	func testFileNotFound() throws {
		let result = ConfigLoader.parseConfig(named: "Foo") as Result<ConfigModel, ConfigLoader.ConfigError>
		guard case let .failure(error) = result else { XCTFail(); return }
		XCTAssertEqual(ConfigLoader.ConfigError.fileNotFound, error)
	}

	func testFileNotLoadable() throws {
		// No possibility to test this case
	}

	func testConfigNotDecodable() throws {
		let result = ConfigLoader
			.parseConfig(named: "Config.plist", bundle: Bundle(for: ConfigLoaderTests.self)) as Result<MissmatchingModel, ConfigLoader.ConfigError>
		guard case let .failure(error) = result else { XCTFail(); return }
		XCTAssertEqual(ConfigLoader.ConfigError.configNotDecodable, error)
	}
}

private struct ConfigModel: Decodable {
	var id: String = ""
	var name: String = ""
	var email: String = ""
	var age: Int = 0
}

private struct MissmatchingModel: Decodable {
	var id: String = ""
	var name: String = ""
	var age: String = ""
}
