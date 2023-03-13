import INCommons
import XCTest

class ConfigLoaderTests: XCTestCase {
	let configName = ConfigLoader.ConfigName

	func testLoadSuccessful() {
		let result = ConfigLoader
			.parseConfig(named: configName, bundle: Bundle(for: ConfigLoaderTests.self)) as Result<ConfigModel, ConfigLoader.Error>
		guard case let .success(data) = result else { XCTFail(); return }
		XCTAssertEqual("123", data.id)
		XCTAssertEqual(42, data.age)
		XCTAssertEqual("Foo", data.name)
		XCTAssertEqual("info@indie-software.com", data.email)
	}

	func testSubModelLoadsSuccessful() {
		let result = ConfigLoader
			.parseConfig(named: configName, bundle: Bundle(for: ConfigLoaderTests.self)) as Result<SubModel, ConfigLoader.Error>
		guard case let .success(data) = result else { XCTFail(); return }
		XCTAssertEqual("123", data.id)
		XCTAssertEqual("Foo", data.name)
	}

	func testFileNotFound() throws {
		let result = ConfigLoader.parseConfig(named: "Foo") as Result<ConfigModel, ConfigLoader.Error>
		guard case let .failure(error) = result else { XCTFail(); return }
		XCTAssertEqual(ConfigLoader.Error.fileNotFound, error)
	}

	func testFileNotLoadable() throws {
		// No possibility to test this case
	}

	func testConfigNotDecodable() throws {
		let result = ConfigLoader
			.parseConfig(named: configName, bundle: Bundle(for: ConfigLoaderTests.self)) as Result<MissmatchingModel, ConfigLoader.Error>
		guard case let .failure(error) = result else { XCTFail(); return }
		XCTAssertEqual(ConfigLoader.Error.configNotDecodable, error)
	}
}

private struct ConfigModel: Decodable {
	let id: String
	let name: String
	let email: String
	let age: Int
}

private struct SubModel: Decodable {
	let id: String
	let name: String
}

private struct MissmatchingModel: Decodable {
	let id: String
	let foo: Int
}
