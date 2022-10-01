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
			return "unspecified"
		case .phone:
			return "phone"
		case .pad:
			return "pad"
		case .tv:
			return "tv"
		case .carPlay:
			return "carPlay"
		case .mac:
			return "mac"
		@unknown default:
			return "unknown default"
		}
	}

	var isSimulator: Bool {
		deviceProvider.isSimulator
	}

	var deviceOrientationText: String {
		switch deviceProvider.deviceOrientation {
		case .unknown:
			return "unknown"
		case .portrait:
			return "portrait"
		case .portraitUpsideDown:
			return "portraitUpsideDown"
		case .landscapeLeft:
			return "landscapeLeft"
		case .landscapeRight:
			return "landscapeRight"
		case .faceUp:
			return "faceUp"
		case .faceDown:
			return "faceDown"
		@unknown default:
			return "unknown default"
		}
	}
}
