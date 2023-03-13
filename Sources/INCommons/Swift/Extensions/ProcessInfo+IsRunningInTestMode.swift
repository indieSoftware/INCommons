import UIKit

extension ProcessInfo {
	/// The argument expected to passed to the process to indicate the code is running in test mode.
	private static let testModeArgument = "TestMode"

	/// Returns true when the code is running in test mode, otherwise false.
	///
	/// Code is expected to be running in test mode when the argument `TestMode` has been passed on start.
	/// To do this edit the app's scheme, switch to "Test" -> "Arguments", un-tick the checkbox for
	/// "Use the Run action's arguments and environment variables" and add a new entry to
	/// "Arguments passed on Lunch" with the content of "TestMode".
	public static var isRunningInTestMode: Bool {
		ProcessInfo().arguments.contains(testModeArgument)
	}
}
