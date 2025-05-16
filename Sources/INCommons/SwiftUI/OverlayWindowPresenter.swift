import SwiftUI
import UIKit

/// A singleton class responsible for managing a separate `UIWindow`
/// to display an overlay alert on top of all views, including modals.
@MainActor
public final class OverlayWindowPresenter {
	/// A reference to the temporary `UIWindow` used for the overlay alert.
	private var alertWindow: UIWindow?

	public init() {}

	/// Returns true when there is already an overlay currently being shown, otherwise false.
	public var isOverlayAlertVisible: Bool {
		alertWindow != nil
	}

	/// Displays an overlay alert by creating a new `UIWindow` and setting a SwiftUI view as its root.
	///
	/// Does nothing if there is already an overlay alert active.
	///
	/// - parameter view: The SwiftUI `View` to be displayed as an overlay.
	public func present(view: some View) {
		presentOverlayWindow(view: view)
	}

	/// Same as `presentOverlayWindow(view:)`, but with a `ViewBuilder` to accept in-line view creation.
	///
	/// - parameter content: The SwiftUI `View` to be displayed as an overlay.
	public func present(@ViewBuilder content: () -> some View) {
		presentOverlayWindow(view: content())
	}

	private func presentOverlayWindow(view: some View) {
		// Ensure that there is no existing overlay window.
		guard !isOverlayAlertVisible else { return }
		// Ensure that we have a valid and active `UIWindowScene`.
		guard let windowScene = UIApplication.shared.connectedScenes
			.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene
		else {
			return
		}

		// Create a new `UIWindow` attached to the detected `UIWindowScene`.
		let window = UIWindow(windowScene: windowScene)

		// Wrap the provided SwiftUI view in a `UIHostingController` for UIKit compatibility.
		let hostingController = UIHostingController(rootView: view)

		// Set the background color to transparent to allow underlying views to be visible.
		hostingController.view.backgroundColor = .clear
		hostingController.view.isOpaque = false

		// Assign the hosting controller as the root of the new window.
		window.rootViewController = hostingController

		// Make the window key and visible, bringing it to the top.
		window.makeKeyAndVisible()

		// Store the reference to the new overlay window.
		alertWindow = window
	}

	/// Dismisses the currently displayed overlay alert and removes the temporary window.
	public func dismiss() {
		// Set the reference to nil, allowing the window to be deallocated.
		alertWindow?.isHidden = true
		alertWindow?.rootViewController = nil
		alertWindow = nil
	}
}
