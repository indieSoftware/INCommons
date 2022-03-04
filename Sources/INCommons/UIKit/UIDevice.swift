import UIKit

public extension UIDevice {
	/// Returns true if current device is an iPad.
	static var isIPad: Bool {
		current.userInterfaceIdiom == .pad
	}

	/// Returns true if current device is an iPhone.
	static var isIPhone: Bool {
		current.userInterfaceIdiom == .phone
	}

	/// Returns true if current device is an Mac.
	@available(iOS 14, *)
	static var isMac: Bool {
		current.userInterfaceIdiom == .mac
	}

	/**
	 Sets the orientation manually with force.

	 - parameter orientation: The orientation to set.
	 - warning: Using this method is to be considered as a hack. Try to avoid using this method and find an other way instead.
	 */
	static func setOrientation(_ orientation: UIInterfaceOrientation) {
		current.setValue(orientation.rawValue, forKey: "orientation")
	}
}
