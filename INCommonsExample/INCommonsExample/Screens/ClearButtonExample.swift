import INCommons
import SwiftUI

struct ClearButtonExample: View {
	@State var fieldString: String = ""
	@FocusState var fieldIsFocussed: Bool

	var body: some View {
		VStack(spacing: 0) {
			Text("Clear Button Example")
			TextField(
				"Placeholder",
				text: $fieldString,
				axis: .vertical
			)
			.padding()
			.focused($fieldIsFocussed)
			.clearButton(
				text: $fieldString,
				isFocused: Binding(
					get: {
						fieldIsFocussed
					}, set: { value in
						fieldIsFocussed = value
					}
				),
				tintColor: .red,
				baseSize: CGSize(width: 20, height: 20),
				tappableSize: CGSize(width: 100, height: 100),
				image: Image(systemName: "x.square.fill")
			)
			.border(.black, width: 1)
			.padding()
		}
	}
}
