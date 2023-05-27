import Foundation

public extension NotificationCenter {
	/// A bag which can collect multiple notification tokens
	/// to de-register them on release of the bag.
	final class ObserverBag {
		/// A reference to the notification center from which to release the observers from.
		private let notificationCenter: NotificationCenter
		/// A collection of the notification tokens.
		private var unkeyedBag = [ReleaseTrigger<Any>]()

		/// Initializes a notification bag.
		///
		/// - parameter notificationCenter: The `NotificationCenter` instance to keep
		/// a strong reference of it to remove the observers from it when the bag gets released.
		public init(notificationCenter: NotificationCenter = .default) {
			self.notificationCenter = notificationCenter
		}

		/// Adds a notification token to the bag.
		///
		/// Calls `removeObserver` on the notification center with the `observer` as parameter
		/// when this bag gets released.
		///
		/// - parameter observer: The token to add.
		public func add(_ observer: Any) {
			unkeyedBag.append(ReleaseTrigger<Any>(reference: observer, onDeinit: { [notificationCenter] observer in
				notificationCenter.removeObserver(observer)
			}))
		}
	}
}
