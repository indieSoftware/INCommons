import Foundation
import UIKit

@MainActor
public extension CGFloat {
	/// Main screen bounds height
	static var screenHeight: CGFloat { UIScreen.main.bounds.height }
	/// Main screen bounds width
	static var screenWidth: CGFloat { UIScreen.main.bounds.width }
}
