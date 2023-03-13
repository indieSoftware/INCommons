public extension Collection {
	/// Returns the element at the specified index if it is within bounds, otherwise nil.
	subscript(safe index: Index) -> Element? {
		indices.contains(index) ? self[index] : nil
	}
}

public extension MutableCollection {
	subscript(safe index: Index) -> Element? {
		/// Returns the element at the specified index if it is within bounds, otherwise nil.
		get {
			indices.contains(index) ? self[index] : nil
		}

		/// Sets the new element at the specified index if it is within bounds, otherwise does nothing.
		set(newValue) {
			if let newValue, indices.contains(index) {
				self[index] = newValue
			}
		}
	}
}
