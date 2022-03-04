import SwiftUI

public extension View {
	/**
	 Same as the `frame(width:height:alignment:)` modifier, but with a size provided which maps to width and height.

	 - parameter size: The size which will be provided to the `frame(width:height)` modifier by unwrapping the size's widht and height.
	 - parameter alignment: The alignment of this view inside the resulting view.
	 alignment applies if this view is smaller than the size given by the resulting frame.
	 - returns: A view with fixed dimensions of width and height.
	 */
	func frame(size: CGSize, alignment: Alignment = .center) -> some View {
		frame(
			width: size.width,
			height: size.height,
			alignment: alignment
		)
	}
}
