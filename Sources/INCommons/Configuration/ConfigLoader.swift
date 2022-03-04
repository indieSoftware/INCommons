import Foundation

/**
 A helper to load a configuration plist file and mapping it to its model.
 The config file should contain all necessary data to run the app, e.g. server URLs, token IDs, etc.
 The config has to match the corresponding `Configuration` model.
 */
public enum ConfigLoader {
	/// The name of the config plist file in the bundle.
	public static let ConfigName = "Config.plist"

	/// The errors which might occur during parsing a config file.
	public enum ConfigError: Swift.Error {
		case fileNotFound
		case fileNotLoadable
		case configNotDecodable
	}

	/**
	 A `Result` instance with the result of evaluating `transform`
	 as the new success value if this instance represents a success.
	 Decodes instances of data types  from a property list which is located in main bundle.

	 - parameter fileName: The property list's file name which will be decoded.
	 - returns: A 'Result' instance with the result of decoding and an error if there will be a failure
	 */
	public static func parseConfig<Configuration>(
		named fileName: String = ConfigName,
		bundle: Bundle = Bundle.main
	) -> Result<Configuration, ConfigError> where Configuration: Decodable {
		// Load config file from bundle.
		guard let filePath = bundle.path(forResource: fileName, ofType: nil) else {
			return .failure(.fileNotFound)
		}
		guard let fileData = FileManager.default.contents(atPath: filePath) else {
			return .failure(.fileNotLoadable)
		}

		// Decode config file into struct.
		do {
			let config = try PropertyListDecoder().decode(Configuration.self, from: fileData)
			return .success(config)
		} catch {
			return .failure(.configNotDecodable)
		}
	}
}
