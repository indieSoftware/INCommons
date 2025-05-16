import Foundation
import UIKit

public extension UIApplication {
	/// Dismisses the keyboard.
	func dismissKeyboard() {
		sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
