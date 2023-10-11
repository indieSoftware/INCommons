import Foundation

public extension Calendar {
	/// A cached iso8601 calendar.
	///
	/// The calendar's locale and timeZone are set to `testableCurrent` to prevent flaky tests.
	static let iso8601: Calendar = {
		var calendar = Calendar(identifier: .iso8601)
		calendar.locale = .testableCurrent
		calendar.timeZone = .testableCurrent
		return calendar
	}()
}
