import UIKit

/// A concrete implementation of the `ApplicationManager` protocol which can be used in app code
/// to return the corresponding values from `UIApplication`.
@available(iOSApplicationExtension, unavailable)
public final class ApplicationManagerLogic: ApplicationManager {
	public var isScreenLockEnabled: Bool {
		!UIApplication.shared.isIdleTimerDisabled
	}

	public func disableScreenLock() {
		UIApplication.shared.isIdleTimerDisabled = true
	}

	public func enableScreenLock() {
		UIApplication.shared.isIdleTimerDisabled = false
	}

	public init() {}
}
