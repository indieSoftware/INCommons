import Foundation

public extension NotificationCenter {
	final class ObserverBag {
		private let notificationCenter: NotificationCenter
		private var unkeyedBag = [ReleaseTrigger<Any>]()

		public init(notificationCenter: NotificationCenter = .default) {
			self.notificationCenter = notificationCenter
		}

		public func add(_ observer: Any) {
			unkeyedBag.append(ReleaseTrigger<Any>(reference: observer, onDeinit: { [notificationCenter] observer in
				notificationCenter.removeObserver(observer)
			}))
		}
	}
}
