import SwiftUI

public extension View {
	// MARK: - Conditional Modifier

	/**
	 Runs a transform block, but only if the condition is met, otherwise the view remains unchanged.

	 The transform can apply a modifier on the view.

	 ```
	 myView.if(X) { $0.padding(8) }
	 ```

	  See also: [https://fivestars.blog/swiftui/conditional-modifiers.html](https://fivestars.blog/swiftui/conditional-modifiers.html)

	 - parameter condition: The condition which have to be true to get the transform block called.
	 - parameter transform: The transform which should apply the modifier on the view.
	 - returns: Either the new view with the modifier applied or the unmodified view.
	 */
	@ViewBuilder
	func `if`(_ condition: Bool, transform: (Self) -> some View) -> some View {
		if condition {
			transform(self)
		} else {
			self
		}
	}

	/**
	 Runs one or the the other transform block depending on a condition.
	 The transform can apply a modifier on the view.

	 ```
	 myView.if(X) { $0.padding(8) } else: { $0.background(Color.blue) }
	 ```

	 See also: [https://fivestars.blog/swiftui/conditional-modifiers.html](https://fivestars.blog/swiftui/conditional-modifiers.html)

	 - parameter condition: The condition which decides which transform block should be called.
	 - parameter ifTransform: The transform block which gets called when the condition is true.
	 - parameter elseTransform: The transform block which gets called when the condition is false.
	 - returns: The new view with one of the modifiers applied.
	 */
	@ViewBuilder
	func `if`(
		_ condition: Bool,
		if ifTransform: (Self) -> some View,
		else elseTransform: (Self) -> some View
	) -> some View {
		if condition {
			ifTransform(self)
		} else {
			elseTransform(self)
		}
	}

	/**
	 Runs a transform block when an optional could be successfully unwrapped.
	 The transform can then access the unwrapped optional safely and apply any modifer to the view.

	 ```
	 myView.ifLet(optionalColor) { $0.foregroundColor($1) }
	 ```

	 See also: [https://fivestars.blog/swiftui/conditional-modifiers.html](https://fivestars.blog/swiftui/conditional-modifiers.html)

	 - parameter value: The optional.
	 - parameter transform: The transform block called with the unwrapped value.
	 - returns: The new view with the modifier applied or the unchanged view.
	 */
	@ViewBuilder
	func ifLet<Value>(_ value: Value?, transform: (Self, Value) -> some View) -> some View {
		if let value {
			transform(self, value)
		} else {
			self
		}
	}
}
