import INCommons
import SwiftUI

struct ShareSheet: View {
	@State private var item: ActivityItem?

	var body: some View {
		VStack {
			Button("Share") {
				if let url = URL(string: "https://www.indie-software.com") {
					item = ActivityItem(items: url)
				}
			}
		}
		.activitySheet($item)
	}
}

struct ShareSheet_Previews: PreviewProvider {
	static var previews: some View {
		ShareSheet()
	}
}
