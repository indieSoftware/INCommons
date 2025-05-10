import UIKit

/// The interface of the `ApplicationManager` which can be used to inject different implementations.
/// Normally code should not be directly dependent upon the `UIApplication` because that might break UnitTests
/// when running the tests on a device / simulator which differs from the test's expectations.
/// Therefore, code should get the `UIApplication` instance being injected and for tests it should be mocked.
/// It's expected that the implementation informs the `ObservableObject` of any value changes.
@MainActor
public protocol ApplicationManager {
	/// A boolean which refers `isIdleTimerDisabled`on UIApplication
	var isScreenLockEnabled: Bool { get }

	/// Disables screen dimming automatically
	func disableScreenLock()

	/// Enables screen dimming automatically
	func enableScreenLock()
}
