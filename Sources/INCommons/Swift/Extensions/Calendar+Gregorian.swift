import Foundation

public extension Calendar {
	/// A cached gregorian calendar.
	///
	/// The calendar's locale and timeZone are set to `testableCurrent` to prevent flaky tests.
	static let gregorian: Calendar = {
		var calendar = Calendar(identifier: .gregorian)
		// Not assigning locale to a calendar means the locale is nil.
		// We are not assigning locale because it overrides calendar type.
		// This means that if we want to display weekdays according to
		// Gregorian calendar (week starting from Sunday)
		// locale should not be assigned. If we assign locale .current
		// and the user happens to be in a country that is not accustomed to
		// week starting from Sunday the locale will override the Calendar type
		// and it will act as iso8601 calendar (the start of the week will be Monday).
		// Most countries are not used to a week starting from Sunday apart from
		// US, Canada, Japan, Philipines, Brazil, and some other South American countries.
		// And since we are not using locale to command a Calendar to provide its information
		// in different languages, the locale in our case can be Nil.
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
