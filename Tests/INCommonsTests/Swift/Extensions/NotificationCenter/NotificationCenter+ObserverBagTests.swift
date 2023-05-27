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
			// Let the closure hold a strong reference to the dummy object.
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
		let notificationCenter = NotificationCenter()
		var observerBag: NotificationCenter.ObserverBag? = NotificationCenter.ObserverBag(notificationCenter: notificationCenter)

		let notification1Expectation = expectation(description: "notification1Expectation")
		let observerToken1 = notificationCenter.addObserver(
			forName: .NSSystemTimeZoneDidChange,
			object: nil,
			queue: nil
		) { _ in
			notification1Expectation.fulfill()
		}
		observerBag?.add(observerToken1)

		let notification2Expectation = expectation(description: "notification1Expectation")
		notification2Expectation.isInverted = true
		let observerToken2 = notificationCenter.addObserver(
			forName: .NSCalendarDayChanged,
			object: nil,
			queue: nil
		) { _ in
			notification2Expectation.fulfill()
		}
		observerBag?.add(observerToken2)

		// Sanity test that notifications are delivered.
		notificationCenter.post(name: .NSSystemTimeZoneDidChange, object: nil)
		waitForExpectations(timeout: 1)

		// Add new observer to the bag to verify that it's not called later.
		let notification3Expectation = expectation(description: "notification1Expectation")
		notification3Expectation.isInverted = true
		let observerToken3 = notificationCenter.addObserver(
			forName: .NSSystemTimeZoneDidChange,
			object: nil,
			queue: nil
		) { _ in
			notification1Expectation.fulfill()
		}
		observerBag?.add(observerToken3)

		// Release bag which should de-register all observers.
		observerBag = nil
		notificationCenter.post(name: .NSSystemTimeZoneDidChange, object: nil)
		notificationCenter.post(name: .NSCalendarDayChanged, object: nil)
		waitForExpectations(timeout: 1)
	}
}
