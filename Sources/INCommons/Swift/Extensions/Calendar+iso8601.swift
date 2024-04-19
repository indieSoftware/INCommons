import Foundation

public extension Calendar {
	/// A cached iso8601 calendar.
	///
	/// The calendar's locale and timeZone are set to `testableCurrent` to prevent flaky tests.
	static let iso8601: Calendar = {
		var calendar = Calendar(identifier: .iso8601)
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
		//
		// Here we could assign locale, it is a iso8601 calendar and will not have any
		// negative effects, but since we are not assigning locale to Gregorian calendar
		// here calendar locale also should be nil.
		calendar.timeZone = .testableCurrent
		return calendar
	}()
}
