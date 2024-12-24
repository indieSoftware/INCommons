import Foundation

/// A class which holds a reference and calls a closure when the classes' instance gets released.
///
/// - Important: This type is sendable and thus its reference type has to be. Consider using `ReleaseTrigger` if sendable is not needed.
public final class SendableReleaseTrigger<ReferenceType: Sendable>: Sendable {
	/// The object or value to keep a reference on during lifetime of this object.
	private let reference: ReferenceType
	/// The closure to call when this object gets released.
	private let onDeinit: @Sendable (_ reference: ReferenceType) -> Void

	/// Initializes an object.
	///
	/// - parameter reference: The object or value to keep a reference on
	/// during lifetime of this object.
	/// - parameter onDeinit: The closure to call when this object gets released.
	/// As a parameter the `reference` will be passed.
	public init(
		reference: ReferenceType,
		onDeinit: @escaping @Sendable (_ reference: ReferenceType) -> Void
	) {
		self.reference = reference
		self.onDeinit = onDeinit
	}

	deinit {
		onDeinit(reference)
	}
}
