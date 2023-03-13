public extension Int {
	/**
	 Converts a value in seconds into a tuple of minutes and seconds, e.g. 99 → (1, 39).

	 Hours will be displayed in minutes.
	 */
	func secondsToMinutesAndSeconds() -> (minutes: Int, seconds: Int) {
		(self / 60, self % 60)
	}

	/**
	 Adds leading zero to Int if needed, e.g. 5 → 05, 15 → 15, -5 → -05

	 - returns: Modified value as String.
	 */
	func toTwoDigitsString() -> String {
		if self < 0 {
			return String(format: "%03d", self)
		}
		return String(format: "%02d", self)
	}
}
