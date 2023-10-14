import Foundation

public extension TimeZone {
	/// Returns the `GMT` time zone which is equal to UTC.
	static var utc: TimeZone {
		.gmt
	}

	/// Returns the `current` time zone, except in test mode where `UTC` is returned instead to prevent flaky tests.
	///
	/// Relies on `ProcessInfo.isRunningInTestMode` to determine if the code is running in test mode or not.
	static var testableCurrent: TimeZone {
		if ProcessInfo.isRunningInTestMode {
			.utc
		} else {
			.current
		}
	}
}
