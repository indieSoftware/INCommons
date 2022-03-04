import INCommons
import SwiftUI

struct ViewConditions: View {
	@State var strTitle: String = "Press Me!"
	@State var isChanged: Bool = false

	var body: some View {
		VStack {
			Text("Checking if function")
			Button(action: {
				self.isChanged.toggle()
			}, label: {
				Text(strTitle)
					.padding(.all)
					.if(isChanged == true) { $0.background(Color.green) }
			})
		}

		VStack {
			Text("Checking ifLet function")
			Button(action: {}, label: {
				Text(strTitle)
					.padding(.all)
					.ifLet(Color.yellow) { $0.background($1) }
			})
		}
	}
}

struct ViewConditions_Previews: PreviewProvider {
	static var previews: some View {
		ViewConditions()
	}
}
