import Foundation

public extension FileManager {
	/// Checks if a folder already exists and is actually a folder, not a file.
	/// Creates the folder if it doesn't exist, yet.
	/// - parameter folderUrl: The URL of the folder which to ensure its existence.
	/// - throws: Throws an error when the folder exists, but is a file or if the folder could not be created.
	func ensureFolderExists(folderUrl: URL) throws {
		enum CustomError: Error {
			case folderExistsButIsAFile(String)
			case folderCouldNotBeCreated(String)
		}

		var fileFolderIsDirectory: ObjCBool = false
		let fileFolderExists = fileExists(atPath: folderUrl.path, isDirectory: &fileFolderIsDirectory)
		if fileFolderExists {
			if !fileFolderIsDirectory.boolValue {
				throw CustomError.folderExistsButIsAFile("Folder '\(folderUrl)' exists, but is a file!")
			}
			// Folder exists and is really a folder, not a file.
			return
		}

		// Folder does not exist, create it.
		do {
			try createDirectory(at: folderUrl, withIntermediateDirectories: true, attributes: nil)
		} catch {
			throw CustomError.folderCouldNotBeCreated("Folder '\(folderUrl)' couldn't be created: \(error)")
		}
	}
}
