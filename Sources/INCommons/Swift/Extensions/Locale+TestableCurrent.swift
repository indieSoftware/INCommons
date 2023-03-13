import UIKit

public extension Locale {
	/// Returns the Locale with the identifier `en_US_POSIX`.
	static var enUsPosix: Locale {
		Locale(identifier: "en_US_POSIX")
	}

	/// Returns the `current` locale, except in test mode where `enUsPosix` is returned instead to prevent flaky tests.
	///
	/// Relies on `ProcessInfo.isRunningInTestMode` to determine if the code is running in test mode or not.
	static var testableCurrent: Locale {
		if ProcessInfo.isRunningInTestMode {
			return .enUsPosix
		} else {
			return .current
		}
	}
}
