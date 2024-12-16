import Combine

/// A type that publishes changes about its `wrappedValue` property _after_ the property has changed (using `didSet` semantics).
/// Reimplementation of `Combine.Published`, which uses `willSet` semantics.
/// Source: https://stackoverflow.com/questions/69978018/observe-change-on-a-published-var-in-swift-combine-after-didset
@propertyWrapper
public class PostPublished<Value> {
	/// A `Publisher` that emits the new value of `wrappedValue` _after it was_ mutated (using `didSet` semantics).
	public let projectedValue: AnyPublisher<Value, Never>

	/// A `Publisher` that fires whenever `wrappedValue` _was_ mutated.
	/// To access the new value of `wrappedValue`, access `wrappedValue` directly,
	/// this `Publisher` only signals a change, it doesn't contain the changed value.
	public let valueDidChange: AnyPublisher<Void, Never>

	private let didChangeSubject: any Subject<Value, Never>

	public var wrappedValue: Value {
		didSet {
			didChangeSubject.send(wrappedValue)
		}
	}

	/// Initializer for a `PostPublished` property wrapper.
	/// - parameter wrappedValue: The initial value.
	/// - parameter emitCurrentValue: Whether to emit the current wrapped value when subscribing to `projectValue`.
	/// When `true` then `didChangeSubject` will use a `CurrentValueSubject` and thus providing the last value.
	/// When `false` then `didChangeSubject`will use a `PassthroughSubject` instead and thus only passing new value updates.
	/// Defaults to `true`.
	public init(wrappedValue: Value, emitCurrentValue: Bool = true) {
		self.wrappedValue = wrappedValue
		if emitCurrentValue {
			didChangeSubject = CurrentValueSubject(wrappedValue)
		} else {
			didChangeSubject = PassthroughSubject<Value, Never>()
		}
		projectedValue = didChangeSubject.eraseToAnyPublisher()
		valueDidChange = didChangeSubject.voidPublisher()
	}
}
