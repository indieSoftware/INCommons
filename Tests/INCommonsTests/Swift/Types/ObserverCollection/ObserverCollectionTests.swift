import INCommons
import XCTest

final class ObserverCollectionTests: XCTestCase {
	private var sut: ObserverCollection<ObserverTester>!

	override func setUp() {
		super.setUp()

		sut = ObserverCollection()
	}

	override func tearDown() {
		sut = nil

		super.tearDown()
	}

	func test_returnsMultipleObserversInRegistrationOrder() {
		let tester1 = ObserverTester(id: 1)
		let tester2 = ObserverTester(id: 2)

		sut.add(observer: tester1)
		sut.add(observer: tester2)

		let result = sut.observers
		XCTAssertEqual(result, [tester1, tester2])
	}

	func test_removeObserverKeepsOthers() {
		let tester1 = ObserverTester(id: 1)
		let tester2 = ObserverTester(id: 2)
		let tester3 = ObserverTester(id: 3)

		sut.add(observer: tester1)
		sut.add(observer: tester2)
		sut.add(observer: tester3)

		sut.remove(observer: tester2)

		let result = sut.observers
		XCTAssertEqual(result, [tester1, tester3])
	}
}

private final class ObserverTester: Sendable, Equatable {
	let id: Int

	init(id: Int) {
		self.id = id
	}

	static func == (lhs: ObserverTester, rhs: ObserverTester) -> Bool {
		lhs.id == rhs.id
	}
}
