import Foundation

/// A class which holds a reference and calls a closure when the classes' instance gets released.
public class ReleaseTrigger<ReferenceType> {
	/// The object or value to keep a reference on during lifetime of this object.
	private let reference: ReferenceType
	/// The closure to call when this object gets released.
	private let onDeinit: (_ reference: ReferenceType) -> Void

	/// Initializes an object.
	///
	/// - parameter reference: The object or value to keep a reference on
	/// during lifetime of this object.
	/// - parameter onDeinit: The closure to call when this object gets released.
	/// As a parameter the `reference` will be passed.
	public init(
		reference: ReferenceType,
		onDeinit: @escaping (_ reference: ReferenceType) -> Void
	) {
		self.reference = reference
		self.onDeinit = onDeinit
	}

	deinit {
		onDeinit(reference)
	}
}
