/// A bag which holds a list of weakly referenced observers.
public actor WeakObserverBag {
	/// A list to wrapped object holders which are keeping a weak reference of an observer.
	private var observers = [WeakObject]()

	/// Adds an observer to the bag.
	public func add(observer: AnyObject) {
		cleanUp()
		let weaker = WeakObject(object: observer)
		observers.append(weaker)
	}

	/// Removes an observer from the bag.
	public func remove(observer: AnyObject) {
		observers.removeAll { $0.object === observer }
		cleanUp()
	}

	/// Notifies all observers by calling `action` on each observer.
	///
	/// To ensure an observer only gets called on the main thread mark its delegate method with `@MainActor`:
	///
	/// ```
	/// public protocol DelegateType: AnyObject, Sendable {
	///   @MainActor
	///   func notifyMethod()
	/// }
	/// ```
	///
	/// Example how to use this method:
	///
	/// ```
	/// await observerBag.notifyObservers { (delegate: DelegateType) in
	///   await delegate.notifyMethod()
	/// }
	/// ```
	///
	/// - parameter action: A closure which gets the casted observer passed.
	/// It's the responsibility of the closure to call the corresponding delegate method.
	public func notifyObservers<T: Sendable>(action: @escaping @Sendable (_ observer: T) async -> Void) async {
		cleanUp()
		for observer in observers {
			if let castedObserver = observer.object as? T {
				await action(castedObserver)
			}
		}
	}

	/// Removes all observers which have already been released and thus are currently nil.
	/// However, since objects can be released at any time this is no guarantee that after
	/// calling this method no nil references are in the bag.
	private func cleanUp() {
		observers.removeAll(where: { $0.object == nil })
	}

	/// A class holding a weak reference to an object which becomes a weak wrapper for an observer.
	/// This ensures that no observer is hold strongly, however, that means that the object reference
	/// can become nil at any time.
	private class WeakObject {
		weak var object: AnyObject?
		init(object: AnyObject) {
			self.object = object
		}
	}
}
