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

	 Apple recommends to use the `Documents` directory for user-generated content
	 and to use subdirectories to organize the content even further.
	 This includes anything a user might create, view or delete through our app,
	 e.g. text files, drawings, videos, images, audio files etc.

	 Files in this directory get backed up by iCloud.

	 The system additionally creates the `Documents/Inbox` directory contains files
	 which the app was asked to open by other applications.
	 It's possible to read and delete those files, but not to edit them or create new files.

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

	 This folder can be used to store app supporting files like cached data
	 that can be recreated at any time and needs to persist longer than files
	 in the tmp directory, e.g. thumbnails.
	 The system may delete the directory on rare occasions to free up disk space.

	 Files in this directory don't get backed up by iCloud.

	 - returns: The URL to the directory.
	 */
	static var cachesDirectory: URL {
		guard let url = Self.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
			fatalError("Could not locate folder 'Library/Caches'")
		}
		return url
	}

	/**
	 Returns the app's `Library/Application Support` directory.

	 This folder can be used to store app supporting files the app needs,
	 but which should not be exposed to the user, e.g. configuration files,
	 templates, data bases, etc.
	 These files will not be deleted by the system, therefore, it's the app's
	 responsibility to manage those files.

	 Files in this folder get backed up by iCloud defaultly.
	 However, for files which can be recreated, e.g. downloads from a server,
	 it's possible to exclude files and folders from being backed up
	 via `URLResourceValues`.

	 ```
	 var resourceValues = URLResourceValues()
	 resourceValues.isExcludedFromBackup = true
	 url.setResourceValues(resourceValues)
	 ```

	 - returns: The URL to the directory.
	 */
	static var appSupportDirectory: URL {
		guard let url = Self.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
			fatalError("Could not locate folder 'Library/Application Support'")
		}
		return url
	}

	/**
	 Returns the application's `tmp` directory.

	 This folder can be used to temporarily save files, i.e. to extract compressed files
	 before moving the decompressed files to a different place.
	 The system periodically purges these files, therefore, don't rely on these files
	 because they can be deleted at any time.

	 Files in this directory don't get backed up by iCloud.

	 - returns: The URL to the directory.
	 */
	static var tmpDirectory: URL {
		URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
	}
}
