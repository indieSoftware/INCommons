import INCommons
import XCTest

final class Array_OrderedIndexTests: XCTestCase {
	/// Tests finding the exact position of an existing element.
	func testOrderedIndexOfExistingElement() {
		let array = [1, 3, 5, 7, 9, 11]
		let index = array.orderedIndexOf(7, isOrderedBefore: <)

		XCTAssertEqual(index, 3, "The index of element 7 should be 3")
	}

	/// Tests finding the position where an element would be inserted if not present.
	func testOrderedIndexOfNonExistingElement() {
		let array = [1, 3, 5, 7, 9, 11]
		let index = array.orderedIndexOf(6, isOrderedBefore: <)

		XCTAssertEqual(index, 3, "The element 6 should be inserted at index 3 to maintain order")
	}

	/// Tests insertion at the beginning of the array.
	func testOrderedIndexAtBeginning() {
		let array = [3, 5, 7, 9]
		let index = array.orderedIndexOf(1, isOrderedBefore: <)

		XCTAssertEqual(index, 0, "The element 1 should be inserted at the beginning (index 0)")
	}

	/// Tests insertion at the end of the array.
	func testOrderedIndexAtEnd() {
		let array = [3, 5, 7, 9]
		let index = array.orderedIndexOf(10, isOrderedBefore: <)

		XCTAssertEqual(index, 4, "The element 10 should be inserted at the end (index 4)")
	}

	/// Tests with an empty array.
	func testOrderedIndexInEmptyArray() {
		let array: [Int] = []
		let index = array.orderedIndexOf(5, isOrderedBefore: <)

		XCTAssertEqual(index, 0, "The element 5 should be inserted at index 0 in an empty array")
	}

	/// Tests with duplicate elements to ensure correct position.
	func testOrderedIndexWithDuplicates() {
		let array = [1, 2, 2, 2, 3]
		let index = array.orderedIndexOf(2, isOrderedBefore: <)

		XCTAssertTrue(index >= 1 && index <= 3, "The index of element 2 should be within the duplicate range (1-3)")
	}

	/// Tests using a custom comparator (descending order).
	func testOrderedIndexWithCustomComparator() {
		let array = [9, 7, 5, 3, 1]
		let index = array.orderedIndexOf(4, isOrderedBefore: >)

		XCTAssertEqual(index, 3, "The element 4 should be inserted at index 3 in descending order")
	}
}
