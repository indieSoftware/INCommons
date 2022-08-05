import UIKit

public extension UIColor {
	/**
	 Uses a `NSKeyedArchiver` to encode the color into a data object.

	 - returns: The encoded color as a data object.
	 */
	func asData() -> Data? {
		try? NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
	}
}

public extension Data {
	/**
	 Uses a `NSKeyedArchiver` to decode the color from a data object.

	 - returns: The decoded color.
	 */
	func asUIColor() -> UIColor? {
		try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(self) as? UIColor
	}
}
