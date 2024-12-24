import INCommons
import SwiftUI

struct OverlayButtonExample: View {
	var body: some View {
		VStack(spacing: 0) {
			Text("OverlayButtonExample")

			HStack(spacing: 0) {
				Text("Text left of ")

				OverlayButton(
					action: { print("Button tapped") },
					baseShape: {
						Image(systemName: "checkmark")
					},
					decoration: { baseShape in
						baseShape
							.frame(width: 100, height: 100)
							.background(Color.green.opacity(0.3))
					}
				)

				Text(" and the text on the right.")
			}

			Text("None of them gets pushed away.")
			Text("Green area is the button's touch area.")
		}
	}
}
