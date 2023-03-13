import INCommons
import XCTest

class FileManager_DirectoryTests: XCTestCase {
	func testHomeDirectoryEndsWithSlash() {
		let result = FileManager.homeDirectory
		XCTAssertTrue(result.absoluteString.hasSuffix("/"))
	}

	func testDocumentsDirectoryEndsWithDocuments() {
		let result = FileManager.documentsDirectory
		XCTAssertTrue(result.absoluteString.hasSuffix("/Documents/"))
	}

	func testCachesDirectoryEndsWithLibraryCaches() {
		let result = FileManager.cachesDirectory
		XCTAssertTrue(result.absoluteString.hasSuffix("/Library/Caches/"))
	}

	func testAppSupportDirectoryEndsWithApplicationSupport() {
		let result = FileManager.appSupportDirectory
		XCTAssertTrue(result.absoluteString.hasSuffix("/Application%20Support/"))
	}

	func testTmpDirectoryEndsWithTmp() {
		let result = FileManager.tmpDirectory
		XCTAssertTrue(result.absoluteString.hasSuffix("/tmp/"))
	}
}
