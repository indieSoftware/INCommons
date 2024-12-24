import INCommons
import SwiftUI

struct ClearButtonExample: View {
	@State var fieldString: String = ""

	var body: some View {
		VStack(spacing: 0) {
			Text("Clear Button Example")
			TextField(
				"Placeholder",
				text: $fieldString,
				axis: .vertical
			)
			.clearButton(
				text: $fieldString,
				tintColor: .red,
				baseSize: CGSize(width: 20, height: 20),
				tappableSize: CGSize(width: 100, height: 100),
				image: Image(systemName: "x.square.fill")
			)
			.border(.black, width: 1)
		}
	}
}
