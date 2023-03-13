import SwiftUI

public extension EdgeInsets {
	/// A constructor where the edges for vertical are equal and those for horizontal also.
	/// - Parameters:
	///   - horizontal: The leading and trailing insets.
	///   - vertical: The top and bottom insets.
	init(horizontal: CGFloat, vertical: CGFloat) {
		self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
	}

	/// An edge insets with a value of zero for all edges.
	static let zero = EdgeInsets(horizontal: 0, vertical: 0)
}
