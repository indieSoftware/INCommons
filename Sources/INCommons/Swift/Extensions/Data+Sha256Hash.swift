import CryptoKit
import Foundation

public extension Data {
	/// Returns a SHA 256 stable hash from the data.
	var sha256Hash: SHA256.Digest {
		SHA256.hash(data: self)
	}

	/// Returns the SHA 256 stable hash as a string.
	var sha256HashString: String {
		sha256Hash.compactMap { String(format: "%02x", $0) }.joined()
	}

	/// Returns the first 64 bits of the SHA 256 stable hash as an integer.
	var sha256HashInt: Int {
		sha256Hash.prefix(8).reduce(0) { $0 << 8 | Int($1) }
	}
}

public extension String {
	/// Returns a SHA 256 stable hash from the string.
	var sha256HashString: String {
		Data(utf8).sha256HashString
	}

	/// Creates the SHA 256 stable hash and returns the first 64 bits as an integer.
	var sha256HashInt: Int {
		Data(utf8).sha256HashInt
	}
}
