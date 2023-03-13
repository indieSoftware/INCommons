public extension String {
	/// Represents the empty string `""`.
	static let empty = ""

	/**
	 Crops the string to a given number of characters, truncating the rest and replacing the last 3 characters with '...'.

	 Returns the unmodified string if it has equal or less characters.

	 When cropping would result in less than 3 characters then the three dot's will be skipped and only the cropped text will be returned.

	 - parameter numberOfCharacters: The maximum length the string should have. Negative values are ignored.
	 - returns: The truncated string.
	 */
	func truncated(numberOfCharacters: Int) -> String {
		if count <= numberOfCharacters || numberOfCharacters < 0 {
			return self
		}

		if numberOfCharacters <= 3 {
			let endIndex = index(startIndex, offsetBy: numberOfCharacters)
			return String(self[..<endIndex])
		}

		let endIndex = index(startIndex, offsetBy: numberOfCharacters - 3)
		return String(self[..<endIndex] + "...")
	}

	/**
	 Returns this string with the first character capitalized, leaving the rest unchanged.

	 When the first character is replaced by multiple characters when uppercased then only the first replacing character gets uppercased.

	 Examples:

	 - "ǆ" -> "ǅ"
	 - "ß" -> "Ss"
	 - "œ" -> "Œ"

	 Usually this is the desired behavior when capitalizing a string rather than `firstUppercased`.
	 */
	var firstCapitalized: String { prefix(1).capitalized + dropFirst() }

	/**
	 Returns the string with the first character uppercased, leaving the rest unchanged.

	 When the first character is replaced by multiple characters when uppercased then all replacing characters get uppercased.

	 Examples:

	 - "ǆ" -> "Ǆ"
	 - "ß" -> "SS"
	 - "œ" -> "Œ"

	 Usually `firstCapitalized` is the desired behavior.
	 */
	var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
