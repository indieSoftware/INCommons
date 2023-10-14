import Foundation

public extension Calendar {
	/// A cached gregorian calendar.
	///
	/// The calendar's locale and timeZone are set to `testableCurrent` to prevent flaky tests.
	static let gregorian: Calendar = {
		var calendar = Calendar(identifier: .gregorian)
		calendar.locale = .testableCurrent
		calendar.timeZone = .testableCurrent
		return calendar
	}()

	/// Returns the `current` calendar, except in test mode where `gregorian` is returned instead to prevent flaky tests.
	///
	/// Relies on `ProcessInfo.isRunningInTestMode` to determine if the code is running in test mode or not.
	static var testableCurrent: Calendar {
		if ProcessInfo.isRunningInTestMode {
			.gregorian
		} else {
			.current
		}
	}
}
