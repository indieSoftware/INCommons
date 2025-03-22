import SwiftUI

/// A re-created button view which looks like Apple's color picker button.
/// The problem with Apple's color picker is that it's directly linked to the color picker view,
/// so there is no way to navigate first to a different screen before showing Apple's color picker.
/// To by-pass this shortcoming we can use this custom button.
public struct ColorPickerButton: View {
	enum Constants {
		static let colorButtonSize: CGSize = .init(width: 36, height: 36)
		static let colorButtonInnerCircleSize: CGSize = .init(width: 26, height: 26)
		static let colorButtonEndAngle: CGFloat = 360
		static let colorButtonStrokeWidth: CGFloat = 3
		static let colorButtonGradient = Gradient(
			colors: [
				Color(uiColor: UIColor(hex: "E7E040") ?? .clear),
				Color(uiColor: UIColor(hex: "EEAA3C") ?? .clear),
				Color(uiColor: UIColor(hex: "E8403B") ?? .clear),
				Color(uiColor: UIColor(hex: "B33ED5") ?? .clear),
				Color(uiColor: UIColor(hex: "694AE8") ?? .clear),
				Color(uiColor: UIColor(hex: "3CCAE7") ?? .clear),
				Color(uiColor: UIColor(hex: "3CE885") ?? .clear),
				Color(uiColor: UIColor(hex: "89E743") ?? .clear),
				Color(uiColor: UIColor(hex: "E7E040") ?? .clear)
			]
		)
	}

	private let color: Color
	private let action: () -> Void
	public init(color: Color, action: @escaping () -> Void) {
		self.color = color
		self.action = action
	}

	public var body: some View {
		Button {
			action()
		} label: {
			ZStack {
				Circle()
					.frame(size: Constants.colorButtonInnerCircleSize)
					.foregroundStyle(color)
				Circle()
					.strokeBorder(
						AngularGradient(
							gradient: Constants.colorButtonGradient,
							center: .center,
							startAngle: .zero,
							endAngle: .degrees(Constants.colorButtonEndAngle)
						),
						lineWidth: Constants.colorButtonStrokeWidth
					)
			}
			.frame(size: Constants.colorButtonSize)
		}
	}
}
