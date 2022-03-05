import Foundation

/**
 A helper to load a configuration plist file and mapping it to its model.
 The config file should contain all necessary data to run the app, e.g. server URLs, token IDs, etc.
 The config has to match the corresponding `Configuration` model.
 */
public enum ConfigLoader {
	/// The name of the config plist file in the bundle, equals to `Config.plist`.
	public static let ConfigName = "Config.plist"

	/// The errors which might occur during parsing a config file.
	public enum Error: Swift.Error {
		/// No config file with the given name could be found in the provided bundle.
		case fileNotFound
		/// The config file couldn't be loaded for any reason.
		case fileNotLoadable
		/// The provided model's type doesn't match the config's structure and thus couldn't be decoded.
		case configNotDecodable
	}

	/**
	 Parses the config file into its model.

	 Specify the name of the config file and the bundle where to find it.
	 Then provide the model's type as the result into which the method should try to decode the file's content into.

	 ```
	 guard case let .success(config) = ConfigLoader.parseConfig() as Result<MyConfigModel, ConfigLoader.Error> else {
	 return
	 }
	 ```

	 - parameter fileName: The property list's file name which will be decoded. Defaults to `ConfigName`.
	 - parameter bundle: The bundle from which to load the config file. Defaults to the `main` bundle.
	 - returns: A `Result` instance with either the decoded model or the error.
	 */
	public static func parseConfig<Configuration>(
		named fileName: String = ConfigName,
		bundle: Bundle = Bundle.main
	) -> Result<Configuration, Error> where Configuration: Decodable {
		// Load config file from bundle.
		guard let filePath = bundle.path(forResource: fileName, ofType: nil) else {
			return .failure(.fileNotFound)
		}
		guard let fileData = FileManager.default.contents(atPath: filePath) else {
			return .failure(.fileNotLoadable)
		}

		// Decode config file into model.
		do {
			let config = try PropertyListDecoder().decode(Configuration.self, from: fileData)
			return .success(config)
		} catch {
			return .failure(.configNotDecodable)
		}
	}
}
