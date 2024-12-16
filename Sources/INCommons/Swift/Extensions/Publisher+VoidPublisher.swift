import Combine
import Foundation

public extension Publisher {
	/// Maps the `Output` of its upstream to `Void` and type erases its upstream to `AnyPublisher`.
	func voidPublisher() -> AnyPublisher<Void, Failure> {
		map { _ in () }
			.eraseToAnyPublisher()
	}
}
