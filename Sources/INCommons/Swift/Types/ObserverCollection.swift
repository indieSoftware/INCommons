/// Provides a type to collect multiple observers to inform them about specific events.
public class ObserverCollection<ObserverType: AnyObject> {
	/// The bag of observers registered so far.
	public private(set) var observers = [ObserverType]()

	public init() {}

	/// Adds a new observer to the list of observers.
	///
	/// - parameter observer: The observer to add.
	public func add(observer: ObserverType) {
		observers.append(observer)
	}

	/// Removes an observer from the list of registered observers.
	///
	/// - parameter observer: The observer to remove.
	public func remove(observer: ObserverType) {
		observers.removeAll { $0 === observer }
	}
}
