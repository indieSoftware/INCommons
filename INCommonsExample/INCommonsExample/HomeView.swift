import INCommons
import SwiftUI

struct FunctionalityRow: View {
	var itemText: String
	var body: some View {
		Text(itemText)
	}
}

struct HomeView: View {
	let exampleViews = [
		ExampleViewFactory(title: "Configuration", view: { AnyView(ConfigurationView()) }),
		ExampleViewFactory(title: "Clear Button", view: { AnyView(ClearButtonExample()) }),
		ExampleViewFactory(title: "Device Provider", view: { AnyView(DeviceProviderView()) }),
		ExampleViewFactory(title: "First Appear View", view: { AnyView(FirstAppearView()) }),
		ExampleViewFactory(title: "Overlay Button", view: { AnyView(OverlayButtonExample()) }),
		ExampleViewFactory(title: "Share Sheet", view: { AnyView(ShareSheet()) }),
		ExampleViewFactory(title: "View Condition", view: { AnyView(ViewConditions()) }),
		ExampleViewFactory(title: "View Frame", view: { AnyView(ViewFrame()) }),
        ExampleViewFactory(title: "Color Picker", view: { AnyView(ColorPickerExample()) })

	]

	var body: some View {
		NavigationView {
			List(exampleViews) { factory in
				NavigationLink(destination: factory.view()) {
					FunctionalityRow(itemText: factory.title)
						.frame(alignment: .center)
				}
			}
			.navigationBarTitle(Text("Commons"))
		}
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
