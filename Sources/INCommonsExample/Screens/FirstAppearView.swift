import INCommons
import SwiftUI

struct FirstAppearView: View {
	var body: some View {
		VStack {
			NavigationLink("Go to other view") {
				Text("Other view")
			}
		}.onAppear {
			print("OnAppear triggered")
		}.onFirstAppear {
			print("OnFirstAppear triggered")
		}
	}
}
