import INCommons
import SwiftUI

struct OverlayWindowPresenterExample: View {
	let overlayWindowPresenter = OverlayWindowPresenter()

	var body: some View {
		VStack {
			Button(action: {
				overlayWindowPresenter.present(
					view: overlayView
				)
			}, label: {
				Text("Present Overlay")
			})
		}
	}

	private var overlayView: some View {
		ZStack {
			Color.black
				.opacity(0.7)
				.ignoresSafeArea()

			Button(action: {
				overlayWindowPresenter.dismiss()
			}, label: {
				VStack {
					Text("Dismiss Overlay")
				}
				.padding(50)
				.background(Color.white)
			})
		}
	}
}
