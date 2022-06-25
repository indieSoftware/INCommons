import Foundation

public extension FileManager {
	/**
	 Returns the application's home directory.

	 This points to the app's sandbox.
	 Shorthand for calling `NSHomeDirectory()`.

	 - returns: The URL to the directory.
	 */
	static var homeDirectory: URL {
		URL(fileURLWithPath: NSHomeDirectory(), isDirectory: true)
	}

	/**
	 Returns the app's `Documents` directory.

	 - returns: The URL to the directory.
	 */
	static var documentsDirectory: URL {
		guard let url = Self.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
			fatalError("Could not locate folder 'Documents'")
		}
		return url
	}

	/**
	 Returns the app's `Library/Caches` directory.

	 - returns: The URL to the directory.
	 */
	static var cachesDirectory: URL {
		guard let url = Self.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
			fatalError("Could not locate folder 'Library/Caches'")
		}
		return url
	}

	/**
	 Returns the application's `tmp` directory.

	 - returns: The URL to the directory.
	 */
	static var tmpDirectory: URL {
		URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
	}
}
