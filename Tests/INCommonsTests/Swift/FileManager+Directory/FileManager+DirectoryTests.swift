import INCommons
import XCTest

class FileManager_DirectoryTests: XCTestCase {
	func testDocumentDirectoryEndsWithDocuments() {
		let result = FileManager().documentDirectory
		XCTAssertTrue(result.absoluteString.hasSuffix("/Documents/"))
	}
}
