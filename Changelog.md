# Changelog

### v4.0.0 (in development)

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
