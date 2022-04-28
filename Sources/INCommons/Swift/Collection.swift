public extension Collection {
	/**
	 Wraps the result from an `enumerated` call in an `Array`.

	 Useful for `ForEach` loops which should enumerate over elements of an array which are not conforming to `Identifiable`.

	 Example of usage:

	 ```
	 let myArray = [something, anotherThing]
	 ForEach(myArray.enumeratedArray(), id: \.offset) { offset, element in
	 ...
	 }

	 ```
	 */
	func enumeratedArray() -> [(offset: Int, element: Self.Element)] {
		Array(enumerated())
	}
}
