import Foundation

/**
 Provides a given object or struct to the block.

 This brings the Kotlin functional pattern of `with` to Swift.

 Use it to create an instance and modify it on a limited scope.
 See also https://betterprogramming.pub/better-swift-with-with-4b071b5ac394

 Usage:
 ```
 func makeButton(_ title: String?) -> UIButton {
      with(UIButton()) {
          $0.translatesAutoresizingMaskIntoConstraints = false
          $0.titleLabel?.text = title
          $0.titleLabel?.font = .headline
          $0.setTitleColor(.red, for: .normal)
      }
 }
 ```
 */
@discardableResult
@inlinable
public func with<V>(_ value: V, _ mutate: (_ v: inout V) -> Void) -> V {
	var mutableValue = value
	mutate(&mutableValue)
	return mutableValue
}
