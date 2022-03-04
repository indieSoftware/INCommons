import Foundation

public extension FileManager {
	/**
	 Returns the document directory of the application.

	 - returns: The URL to the application's document directory.
	 */
	var documentDirectory: URL {
		urls(for: .documentDirectory, in: .userDomainMask)[0]
	}
}
