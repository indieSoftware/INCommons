import SwiftUI

public extension View {
	/// Executes the action when the view appears the first time.
	/// Similar to SwiftUI's `onAppear`, but fires only once.
	func onFirstAppear(_ action: @escaping () -> Void) -> some View {
		modifier(FirstAppear(action: action))
	}
}

private struct FirstAppear: ViewModifier {
	/// The action to execute when the content view appears the first time.
	let action: () -> Void

	/// Used to save the state whether the block has been called once or not.
	@State private var hasAppeared = false

	func body(content: Content) -> some View {
		content.onAppear {
			guard !hasAppeared else { return }
			hasAppeared = true
			action()
		}
	}
}
