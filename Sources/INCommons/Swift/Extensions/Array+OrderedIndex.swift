extension Array {
	/// Finds the index where an element should be in a sorted array.
	///
	/// Can be used to determine the insertion index into the sorted array.
	/// Requires the array being in sorted order.
	/// Finding the index has a complexity of O(log n).
	/// Uses "binary search" for determining the matching index: https://en.wikipedia.org/wiki/Binary_search_algorithm
	///
	/// - parameter element: The element to insert.
	/// - parameter isOrderedBefore: A closure which determines whether one element is ordered before another.
	/// Should return `true` when `lhs` is ordered before `rhs`, `false` when `rhs` is ordered before `lhs` or both share the same position.
	func orderedIndexOf(_ element: Element, isOrderedBefore: (_ lhs: Element, _ rhs: Element) -> Bool) -> Int {
		var lowerBound = 0
		var higherBound = count - 1

		while lowerBound <= higherBound {
			let index = (lowerBound + higherBound) / 2
			if isOrderedBefore(self[index], element) {
				lowerBound = index + 1
			} else if isOrderedBefore(element, self[index]) {
				higherBound = index - 1
			} else {
				// Found element at position index.
				return index
			}
		}

		// No matching element found, would be at position of lowerBound.
		return lowerBound
	}
}
