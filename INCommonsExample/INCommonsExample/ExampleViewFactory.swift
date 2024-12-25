import SwiftUI

struct ExampleViewFactory: Identifiable {
	let title: String
	let view: () -> AnyView

	var id: String {
		title
	}
}
