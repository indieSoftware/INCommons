import Foundation
import UIKit

public extension UIApplication {
	/// Applies the given display mode to all windows, overriding the user interface style that way.
	/// - parameter displayMode: The display mode (light, dark, automatic) to apply.
	func applyDisplayMode(_ displayMode: UIUserInterfaceStyle) {
		connectedScenes.forEach { scene in
			guard let scene = scene as? UIWindowScene else { return }
			for window in scene.windows {
				window.overrideUserInterfaceStyle = displayMode
			}
		}
	}
}
