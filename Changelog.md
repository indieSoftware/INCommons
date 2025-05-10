# Changelog

### v4.1.0

- Added `newLine` property to the `String` extension.
- Introduced an `ApplicationManager` to control the screen lock mechanism.
- Improved the `ClearButtonModifier` to show & hide itself depending on a focus binding.
- Introdcued a `ColorPickerButton` mimicing Apple's ColorPicker button.

### v4.0.1

- Moved the example project to its own folder.

### v4.0.0

- Added `homeDirectory`, `cachesDirectory`, `appSupportDirectory` and `tmpDirectory` to `FileManager` extension.
- Added `base64Encoded` and `base64Decoded` as a string extension.
- Added `RgbaColor` inclusive initializer and return value for `UIColor`.
- Added `UIColor.asData()` and `Data.asUIColor()` extensions to archive and unarchive UIColors.
- Added `View.onFirstAppear` modifier which triggers an action when a view appears, but only once.
- Changed `FileManager().documentDirectory` to `FileManager.documentsDirectory`.
- Changed `DispatchQueue.once(token:block:)` to use a generated default token and an actor.
- Removed `DispatchQueue.performOnMainThread()` in favor of `Task` and `MainActor`.
- Added `ReleaseTrigger` to get a callback when an object gets released.
- Added `NotificationCenter.ObserverBag` to have a container for notification observer tokens which get automatically removed from the notification center when released.
- Added `UIApplication.activeWindowScene` and `UIApplication.keyWindow` to retrieve the current window.
- Added `iso8601` as an extension to Calendar to retrieve ISO8601 calendar format.
- Fixed deprecation warning for `UIColor+KeyedArchiver`.
- Added conformance for `Codable` and `Equatable` to `UIColor.RgbaColor`.
- Added `ClearButtonModifier` and `View.clearButton`.
- Added `OverlayButton`.
- Added `Array.orderedIndexOf()`.
- Added `FileManager.ensureFolderExists(folderUrl:)`.
- Added `Publisher.voidPublisher`.
- Added `LoadingHandler`.
- Added `PostPublished` property wrapper.
- Added `WeakObserverBag`.


### v3.1.0

- Added `firstCapitalized` and `firstUppercased` in the String extension.
- Added `enumeratedArray` as an extension to `Collection`.

### v3.0.1

- Updated Cocoapods to fix a security risk

### v3.0.0

- Added `Optional+Stringified`.
- Removed `UIDevice` properties for `isIPhone`, `isIPad` and `isMac`.
- Added `UIDeviceProvider` to solve `UIDevice` dependencies.

### v2.0.0

Re-created lib from scratch in Swift with an initial code set totally replacing any previous version.
