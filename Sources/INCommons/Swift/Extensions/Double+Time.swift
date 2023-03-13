import Foundation

public extension Double {
	/// Converts a `Double` value given in seconds into a `DispatchTimeInterval.milliseconds` value.
	var dispatchTimeInterval: DispatchTimeInterval {
		DispatchTimeInterval.milliseconds(Int(self * 1000))
	}

	/// Converts a `Double` value into a `TimeInterval` value.
	var timeInterval: TimeInterval {
		TimeInterval(self)
	}
}
