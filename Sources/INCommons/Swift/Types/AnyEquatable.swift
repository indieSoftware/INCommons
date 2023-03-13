import Foundation

/// A type erased Equatable conformance.
/// When defining a custom protocol which should conform to the `Equatable` protocol then
/// comparing two instances of those protocol references still doesn't work.
/// Conform to this protocol instead to make it possible to compare two references.
public protocol AnyEquatable {
	func isEqualTo(_ other: AnyEquatable) -> Bool
}

public extension AnyEquatable where Self: Equatable {
	func isEqualTo(_ other: AnyEquatable) -> Bool {
		guard let other = other as? Self else { return false }
		return self == other
	}
}
