import Foundation

public extension String {
	/// Returns the base64 encoded version, i.e. `"FooBar".base64Encoded == "Rm9vQmFy"`
	var base64Encoded: String? {
		data(using: .utf8)?.base64EncodedString()
	}

	/// Returns the base64 decoded version, i.e. `"Rm9vQmFy".base64Decoded == "FooBar"`
	var base64Decoded: String? {
		guard let data = Data(base64Encoded: self) else { return nil }
		return String(data: data, encoding: .utf8)
	}
}
