import SwiftUI

public struct OverlayButton<BaseShape: View, Content: View>: View {
	private let baseShape: () -> BaseShape
	private let decoration: (BaseShape) -> Content
	private let action: () -> Void

	/// - parameter baseShape: A closure that returns the base shape of the button.
	/// - parameter decoration: A closure that takes the base shape as a parameter and returns the decorated content.
	/// - parameter action: A closure representing the action to be performed when the button is tapped.
	public init(
		action: @escaping () -> Void,
		@ViewBuilder baseShape: @escaping () -> BaseShape,
		@ViewBuilder decoration: @escaping (BaseShape) -> Content
	) {
		self.decoration = decoration
		self.baseShape = baseShape
		self.action = action
	}

	public var body: some View {
		let shape = baseShape()
		shape
			.foregroundColor(.clear)
			.overlay {
				Button {
					action()
				} label: {
					decoration(shape)
				}
			}
	}
}
