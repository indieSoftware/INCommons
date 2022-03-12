import UIKit

public extension UIDevice {
	/**
	 Sets the orientation manually with force.

	 - parameter orientation: The orientation to set.
	 - warning: Using this method is to be considered as a hack. Try to avoid using this method and find an other way instead.
	 */
	static func setOrientation(_ orientation: UIInterfaceOrientation) {
		current.setValue(orientation.rawValue, forKey: "orientation")
	}
}
