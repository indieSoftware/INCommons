import Foundation

public extension Bundle {
	/// Returns the application version number (`CFBundleShortVersionString`), e.g.: "1.0".
	var versionNumber: String {
		object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? String.empty
	}

	/// Returns the application build number (`CFBundleVersion`), e.g.: "42".
	var buildNumber: String {
		object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? String.empty
	}
}
