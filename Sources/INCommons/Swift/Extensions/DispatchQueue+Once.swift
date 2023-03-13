import Foundation

public extension DispatchQueue {
	private actor OnceTracker {
		/// A list of dispatch tokens to track which have been called once.
		private var tokens = [String]()

		/**
		 Performs the block when the token is not part of the tracked tokens.

		 Does nothing when the token has already been added to the list before.
		 When the block gets executed then the token will be added to the list
		 of used tokens which prevents of being used again.
		 */
		func once(token: String, block: @escaping @Sendable () -> Void) {
			if tokens.contains(token) {
				return
			}

			tokens.append(token)
			block()
		}
	}

	/// A global reference to the tokens used to keep track of blocks already executed.
	private static let onceTracker = OnceTracker()

	/**
	 Executes a block of code, associated with a unique token, only once.

	 The code is thread safe and will only execute the block once even in the presence of multithreaded calls.

	 - parameter token: A unique token as key for the block.
	 Use a unique reverse DNS style name such as com.vectorform.<name> or a string representation of a UUID.
	 Defaults to a token created out of the file name, function name and the line number of the method's call.
	 - parameter block: Block to execute once.
	 */
	class func once(token: String = "\(#file).\(#function):\(#line)", block: @escaping @Sendable () -> Void) {
		Task {
			await onceTracker.once(token: token, block: block)
		}
	}
}
