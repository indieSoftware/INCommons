import Combine
import INCommons
import SwiftUI

struct DeviceProviderView: View {
	@StateObject private var viewModel = DeviceProviderViewModel(injectedDeviceProvider: UIDeviceProvider())

	var body: some View {
		VStack(spacing: 10) {
			Text("User Interface Idiom: \(viewModel.userInterfaceIdiomText)")
			Text("Environment: \(viewModel.isSimulator ? "Simulator" : "Physical Device")")
			Text("Device Orientation: \(viewModel.deviceOrientationText)")
			Text(
				"(The device orientation shows \"unknown\" until the device gets rotated, but only on the simulator. On a physical device it gets initialized correctly.)"
			)
			.font(.footnote)
		}
	}
}

@MainActor
private class DeviceProviderViewModel<DeviceProvider: UIDeviceProviderType>: ObservableObject {
	private let deviceProvider: DeviceProvider
	private var deviceProviderCancellable: Cancellable?

	init(injectedDeviceProvider: DeviceProvider) {
		deviceProvider = injectedDeviceProvider
		// Inform observers of this view model when the device provider's values have changed.
		deviceProviderCancellable = deviceProvider.objectWillChange.sink { [weak self] _ in
			print("ViewModel updated")
			self?.objectWillChange.send()
		}
	}

	var userInterfaceIdiomText: String {
		switch deviceProvider.userInterfaceIdiom {
		case .unspecified:
			"unspecified"
		case .phone:
			"phone"
		case .pad:
			"pad"
		case .tv:
			"tv"
		case .carPlay:
			"carPlay"
		case .mac:
			"mac"
		@unknown default:
			"unknown default"
		}
	}

	var isSimulator: Bool {
		deviceProvider.isSimulator
	}

	var deviceOrientationText: String {
		switch deviceProvider.deviceOrientation {
		case .unknown:
			"unknown"
		case .portrait:
			"portrait"
		case .portraitUpsideDown:
			"portraitUpsideDown"
		case .landscapeLeft:
			"landscapeLeft"
		case .landscapeRight:
			"landscapeRight"
		case .faceUp:
			"faceUp"
		case .faceDown:
			"faceDown"
		@unknown default:
			"unknown default"
		}
	}
}
