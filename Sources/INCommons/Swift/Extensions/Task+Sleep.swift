import Foundation

public extension Task where Success == Never, Failure == Never {
	/**
	 Suspends the current task for the given duration in seconds.

	 - parameter seconds: The time to sleep in seconds, which also accepts floating point numbers.
	 */
	static func sleep(seconds: Double) async throws {
		let duration = UInt64(seconds * 1_000_000_000)
		try await sleep(nanoseconds: duration)
	}
}
