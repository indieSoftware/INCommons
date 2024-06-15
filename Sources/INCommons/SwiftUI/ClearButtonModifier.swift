import CoreGraphics
import Foundation
import SwiftUI

public struct ClearButtonModifier: ViewModifier {
	let tintColor: Color
	let baseSize: CGSize
	let tappableSize: CGSize
	let image: Image
	@Binding var text: String

	@ViewBuilder
	public func body(content: Content) -> some View {
		HStack {
			content
			if !text.isEmpty {
				OverlayButton {
					text = .empty
				} baseShape: {
					image
						.frame(size: baseSize)
				} decoration: { shape in
					shape
						.frame(size: tappableSize)
				}
				.foregroundStyle(tintColor)
			}
		}
	}
}

public extension View {
	func clearButton(
		text: Binding<String>,
		tintColor: Color,
		baseSize: CGSize,
		tappableSize: CGSize,
		image: Image
	) -> some View {
		modifier(
			ClearButtonModifier(
				tintColor: tintColor,
				baseSize: baseSize,
				tappableSize: tappableSize,
				image: image,
				text: text
			)
		)
	}
}
