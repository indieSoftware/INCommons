import INCommons
import SwiftUI

struct ViewConditions: View {
	@State var buttonTitle: String = "Toggle me"
	@State var isToggled: Bool = false
	@State var color: Color?

	private func toggleButton() {
		isToggled.toggle()
		color = isToggled ? Color.green : nil
	}

	var body: some View {
		VStack {
			Text("if modifier")
			Button(action: {
				toggleButton()
			}, label: {
				Text(buttonTitle)
					.padding(.all)
					.if(isToggled) { $0.background(Color.green) }
			})

			Spacer().frame(height: 20)

			Text("if-else modifier")
			Button(action: {
				toggleButton()
			}, label: {
				Text(buttonTitle)
					.padding(.all)
					.if(isToggled) { $0.background(Color.green) } else: { $0.background(Color.yellow) }
			})

			Spacer().frame(height: 20)

			Text("ifLet modifier")
			Button(action: {
				toggleButton()
			}, label: {
				Text(buttonTitle)
					.padding(.all)
					.ifLet(color) { $0.background($1) }
			})
		}
	}
}

struct ViewConditions_Previews: PreviewProvider {
	static var previews: some View {
		ViewConditions()
	}
}
