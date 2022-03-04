import SwiftUI
import UIKit

public extension UIColor {
	/// A random opaque color.
	static var random: UIColor {
		UIColor(
			red: CGFloat(arc4random()) / CGFloat(UInt32.max),
			green: CGFloat(arc4random()) / CGFloat(UInt32.max),
			blue: CGFloat(arc4random()) / CGFloat(UInt32.max),
			alpha: 1.0
		)
	}

	/**
	 Creates a color from a hex string. Returns nil if the hex string is invalid.

	 - parameter hex: The hex string value, e.g. "ffe700" or "FFE700FF". The string must have exactly 6 or 8 characters without any leading hashmark (#).
	 Every 2 character block represents a color value and range from 00 to FF. The first two characters describe the red part.
	 The second two characters describe the green part. The third two characters describe the blue part.
	 The first three color parts are mandatory. The fourth two characters describe the alpha part which is optional.
	 When no alpha is provided it will be treated as fully opaque (FF) with an alpha value of `1`.
	 */
	convenience init?(hex: String) {
		let red, green, blue, alpha: CGFloat

		guard hex.count == 6 || hex.count == 8 else {
			return nil
		}

		let scanner = Scanner(string: hex)
		var hexNumber: UInt64 = 0

		guard scanner.scanHexInt64(&hexNumber) else {
			return nil
		}

		if hex.count == 8 {
			red = CGFloat((hexNumber & 0xFF00_0000) >> 24) / 255
			green = CGFloat((hexNumber & 0x00FF_0000) >> 16) / 255
			blue = CGFloat((hexNumber & 0x0000_FF00) >> 8) / 255
			alpha = CGFloat(hexNumber & 0x0000_00FF) / 255
		} else {
			red = CGFloat((hexNumber & 0xFF0000) >> 16) / 255
			green = CGFloat((hexNumber & 0x00FF00) >> 8) / 255
			blue = CGFloat(hexNumber & 0x0000FF) / 255
			alpha = 1.0
		}

		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}

	/// Converts a UIColor into a SwiftUI Color view.
	var colorView: Color {
		Color(self)
	}
}
