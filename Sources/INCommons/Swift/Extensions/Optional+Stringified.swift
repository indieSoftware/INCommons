import Foundation

public extension Optional {
	/**
	 Unwraps this optional and converts its value into a string via `String(describing:)` or returns the fallback string if the optional is nil.

	 - parameter fallback: The string to return when this optional is nil (defaults to the empty string "").
	 - returns: The optional's value as a string or the fallback string.
	 */
	func stringified(_ fallback: String = .empty) -> String {
		switch self {
		case let .some(value):
			return String(describing: value)
		case .none:
			return fallback
		}
	}
}
