import UIKit

/// The interface of the `UIDeviceProvider` which can be used to inject different implementations.
/// Normally code should not be directly dependent upon the `UIDevice` because that might break UnitTests
/// when running the tests on a device / simulator which differs from the test's expectations.
/// Therefore, code should get the `UIDevice` instance being injected and for tests it should be mocked.
/// To make this possible this protocol provides the interface to the user interface idiom and the device orientation
/// while the `UIDeviceProvider` provides an implementation which can be injected when running the code in the app
/// and `UIDeviceProviderMock` a mock which can then be configured and injected in UnitTests.
/// It's expected that the implementation informs the `ObservableObject` of any value changes.
public protocol UIDeviceProviderType: ObservableObject {
	/// The style of interface to use on the current device.
	var userInterfaceIdiom: UIUserInterfaceIdiom { get }

	/// Returns true if this code currently runs on the simulator, false when on a physical device.
	var isSimulator: Bool { get }

	/// The physical orientation of the device.
	var deviceOrientation: UIDeviceOrientation { get }
}

/// A concrete implementation of the `UIDeviceProviderType` protocol which can be used in app code
/// to return the corresponding values from `UIDevice.current`.
/// When instantiating `beginGeneratingDeviceOrientationNotifications()` will be called on
/// `UIDevice.current` to start the generation of device orientations so that `deviceOrientation` returns correct values.
/// On de-init `endGeneratingDeviceOrientationNotifications()` will be called to stop it.
public class UIDeviceProvider: UIDeviceProviderType {
	private var orientationDidChangeNotificationToken: Any?

	public init() {
		orientationDidChangeNotificationToken = NotificationCenter.default.addObserver(
			forName: UIDevice.orientationDidChangeNotification,
			object: nil,
			queue: .main,
			using: { [weak self] _ in
				// Inform observers that the orientation has changed.
				self?.objectWillChange.send()
			}
		)
		UIDevice.current.beginGeneratingDeviceOrientationNotifications()
	}

	deinit {
		UIDevice.current.endGeneratingDeviceOrientationNotifications()
	}

	public var userInterfaceIdiom: UIUserInterfaceIdiom {
		UIDevice.current.userInterfaceIdiom
	}

	public var isSimulator: Bool {
#if targetEnvironment(simulator)
		return true
#else
		return false
#endif
	}

	public var deviceOrientation: UIDeviceOrientation {
		UIDevice.current.orientation
	}
}

/// A mock implementation of the `UIDeviceProviderType` protocol which can be used in UnitTests
/// to have full control of the returned values and thus being independent on the device currently used in the test.
/// This mock makes UnitTests more reliable.
public class UIDeviceProviderMock: UIDeviceProviderType {
	public var userInterfaceIdiom: UIUserInterfaceIdiom {
		didSet {
			objectWillChange.send()
		}
	}

	public var isSimulator: Bool {
		didSet {
			objectWillChange.send()
		}
	}

	public var deviceOrientation: UIDeviceOrientation {
		didSet {
			objectWillChange.send()
		}
	}

	/**
	 Creates a mock instance.

	 - parameter interface: The given interface (defaults to `phone`).
	 - parameter orientation: The device's orientation (defaults to `portrait`).
	 - parameter simulator: Whether the device is the simulator (default) or a physical device.
	 */
	public init(interface: UIUserInterfaceIdiom = .phone, simulator: Bool = false, orientation: UIDeviceOrientation = .portrait) {
		userInterfaceIdiom = interface
		isSimulator = simulator
		deviceOrientation = orientation
	}
}
