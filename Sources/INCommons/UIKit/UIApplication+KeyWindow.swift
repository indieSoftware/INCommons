import UIKit

public extension UIApplication {
	/// Returns the `UIWindowSceen` of the active sceen currently shown to the user.
	var activeWindowScene: UIWindowScene? {
		// Get connected scenes.
		connectedScenes
			// Keep only active scenes, onscreen and visible to the user.
			.filter { $0.activationState == .foregroundActive }
			// Keep only those scenes which are actually window scenes.
			.compactMap { $0 as? UIWindowScene }
			// Pick the first window scene.
			.first
	}

	/// Returns the currently active window.
	var keyWindow: UIWindow? {
		activeWindowScene?.keyWindow
	}
}
