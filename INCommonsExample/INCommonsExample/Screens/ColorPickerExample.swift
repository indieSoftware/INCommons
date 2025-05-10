import INCommons
import SwiftUI

struct ColorPickerExample: View {
	@State var showColorPicker: Bool = false
	@State var selectedColor: Color = .green
	var body: some View {
		ColorPickerButton(color: selectedColor) {
			showColorPicker.toggle()
		}
		.colorPickerSheet(
			isPresented: $showColorPicker,
			selection: $selectedColor,
			supportsAlpha: false,
			title: "Color Picker Example",
			animated: true
		)
	}
}
