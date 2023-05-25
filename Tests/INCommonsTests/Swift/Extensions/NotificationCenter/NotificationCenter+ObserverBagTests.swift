import INCommons
import XCTest

final class NotificationCenter_ObserverBagTests: XCTestCase {
	func testNotificationCenterHoldsStrongReferenceOfObserver() throws {
		let dummyObjectReleasedExpectation = expectation(description: "dummyObjectReleasedExpectation")
		var dummyObject: ReleaseTrigger<Bool>? = ReleaseTrigger<Bool>(reference: false) { _ in
			dummyObjectReleasedExpectation.fulfill()
		}
		weak var weakDummyObject = dummyObject

		let notificationCenter = NotificationCenter()
		let observerToken = notificationCenter.addObserver(
			forName: .NSSystemTimeZoneDidChange,
			object: nil,
			queue: nil
		) { [dummyObject] _ in
			XCTFail("No notification expected to be send")
			_ = dummyObject
		}

		// dummyObject gets hold
		XCTAssertNotNil(weakDummyObject)
		dummyObject = nil
		XCTAssertNotNil(weakDummyObject)

		// only after de-registering the observer the dummyObject gets released
		try notificationCenter.removeObserver(XCTUnwrap(observerToken))
		XCTAssertNil(weakDummyObject)

		waitForExpectations(timeout: 1)
	}

	func testObserverBagKeepsReferenceOfObjectUntilDeinit() {
		let notificationCenter = NotificationCenter()
		var observerBag: NotificationCenter.ObserverBag? = NotificationCenter.ObserverBag(notificationCenter: notificationCenter)

		let releaseTriggerReleasedExpectation = expectation(description: "releaseTriggerReleasedExpectation")
		var releaseTrigger: ReleaseTrigger<Bool>? = ReleaseTrigger(reference: false) { _ in
			releaseTriggerReleasedExpectation.fulfill()
		}
		weak var weakReleaseTrigger = releaseTrigger

		observerBag?.add(releaseTrigger as Any)
		releaseTrigger = nil

		XCTAssertNotNil(weakReleaseTrigger)
		observerBag = nil
		XCTAssertNil(weakReleaseTrigger)

		waitForExpectations(timeout: 1)
	}

	func testObserverBagRemovesObserverFromNotificationCenter() {
		XCTFail("TODO")
	}
}
