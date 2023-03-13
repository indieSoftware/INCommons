# Swift additions

Adds some Swift extensions / additions.

## Bundle

### Marketing version

Use `Bundle.main.versionNumber` to get the marketing version, e.g. `"1.2.3"`.

### Build number

Use `Bundle.main.buildNumber` to get the build version number, e.g. `"42"`.

## Calendar

### Gregorian

Use `Calendar.gregorian` to get a gregorian calendar back which has its `locale` and `timeZone` set to `testableCurrent`.

### Testable current

Use `Calendar.testableCurrent` to get the `current` calendar, except when in `TestMode` where the `gregorian` is returned instead to prevent flaky tests.

The check for `TestMode` happens via `ProcessInfo.isRunningInTestMode`, that means `TestMode` needs to be set as scheme parameter for tests. 

## CGFloat

### Screen size

Use `CGFloat.screenWidth` and `CGFloat.screenHeight` to receive the current main's screen size back.

## Collection

### Enumerated Array

Wrap the result from an `enumerated` call in an `Array`, useful for `ForEach` loops 
which should enumerate over elements of an array which are not conforming to `Identifiable`.

```
let myArray = [something, anotherThing]
ForEach(myArray.enumeratedArray(), id: \.offset) { offset, element in
	...
}
```

### Safe access

Access a collection via the `safe` subscript to receive a nil value instead of crashing the app.

```
let array = ["Foo", "Bar"]
let bar = array[safe: 2]
let nilValue = array[safe: 3]
```

## DispatchQueue

### Dispatch once

Use an easy way to run a piece of code only once:

```
DispatchQueue.once("AnIdentifier") {
	print("This is only printed once even when the method gets called multiple times!")
}
```

### Perform on main thread

A convenience method to run a block of code on the main thread:

```
DispatchQueue.performOnMainThread {
	print("Gets printed immediately when already on the main thread otherwise will be added to the main queue asychronously.")
}
```

## Double

### TimeInterval

Convert a double to a `DispatchTimeInterval` or a `TimeInterval`:

```
let myTime: Double = 1.2
myTime.dispatchTimeInterval
myTime.timeInterval
```

## EdgeInsets

### Zero

Use `EdgeInsets.zero` to receive an edge insets with all sides set to 0.

### Vertical and horizontal initializer

Use `EdgeInsets(horizontal: 12, vertical: 34)` instead of `EdgeInsets(top: 34, leading: 12, bottom: 34, trailing: 12)`.

## FileManager

### Documents directory

An easy accessor to the documents directory:

```
FileManager.default.documentDirectory
```

## Int

### Seconds to minutes & seconds

Convert a value in seconds into a tuple of minutes and seconds. For example 99 seconds become 1 minute and 39 seconds:

```
let (minutes, seconds) = 99.secondsToMinutesAndSeconds()
```

### Two digits string

Adds a leading zero to single digit value to ensure it has two digits:

```
5.toTwoDigitsString() // 05
15.toTwoDigitsString() // 15
-5.toTwoDigitsString() // -05
```

## Locale

### en-US POSIX

Use `Locale.enUsPosix` to get the locale with the identifier `en-US POSIX` back.

### Testable current

Use `Locale.testableCurrent` to get the `current` locale, except when in `TestMode` where the `enUsPosix` is returned instead to prevent flaky tests.

The check for `TestMode` happens via `ProcessInfo.isRunningInTestMode`, that means `TestMode` needs to be set as scheme parameter for tests. 

## Optional

### Stringified

Convert an optional string directly into a string or use a fallback string when the optional is nil:

```
("Foo" as String?).stringified() // "Foo"
(nil as String?).stringified() // ""
(nil as String?).stringified("Fallback") // "Fallback"
```

## ProcessInfo

### Test mode

Code is expected to be running in test mode when the argument `TestMode` has been passed on start.

To do this edit the app's scheme, switch to "Test" -> "Arguments", un-tick the checkbox for "Use the Run action's arguments and environment variables" and add a new entry to "Arguments passed on Lunch" with the content of "TestMode".

After that the call `ProcessInfo.isRunningInTestMode` returns `true` when the code is run in test mode which is usuall unit test. In normal production mode `false` should be returned.

This is used by `Calendar.testableCurrent`, `Locale.testableCurrent` and `TimeZone.testableCurrent` to return the corresponding `current` value except when running the code in unit tests where a fall-back is returned to prevent flaky tests when the tests are run on different devices with different configurations set. 

## String

### Empty string

A constant definition for the empty string: `String.empty`

### Truncate

Crop a string to a given number of characters and adding three dots to its end when cropped:

```
"FooBar".truncated(numberOfCharacters: 5) // Fo...
"FooBar".truncated(numberOfCharacters: 6) // FooBar
```

### Capitalize

Uppercase or capitalize the first character of a string without changing the rest of the string:

```
"myString second".firstCapitalized // "MyString second"
"myString second".firstUppercased // "MyString second"

"ß".firstCapitalized // "Ss"
"ß".firstUppercased // "SS"
```

### Base64 coding

Use `FooBar".base64Encoded` to receive a string encoded to base-64, in this case it returns `"Rm9vQmFy"`.

Use the counter-part `"Rm9vQmFy".base64Decoded` to decode a base-64 string back to its original, here `"FooBar"`.

## Task

### Await for time

To wait for specific amount of seconds in an await/async context:

```	
try await Task.sleep(seconds: 1.5)
```

## TimeZone

### UTC

Use `TimeZone.utc` to get the `UTC` time zone back which is actually `GMT`.

### Testable current

Use `TimeZone.testableCurrent` to get the `current` time zone, except when in `TestMode` where the `utc` is returned instead to prevent flaky tests.

The check for `TestMode` happens via `ProcessInfo.isRunningInTestMode`, that means `TestMode` needs to be set as scheme parameter for tests. 

# Global functions

### Kotlin's `with`

Brings the Kotlin functional pattern of `with` to Swift:

```
let button = with(UIButton()) {
	$0.translatesAutoresizingMaskIntoConstraints = false
	$0.titleLabel?.text = title
	$0.titleLabel?.font = .headline
	$0.setTitleColor(.red, for: .normal)
}
```

# New types

## AnyEquatable

Use the `AnyEquatable` protocol for a type erased Equatable conformance.

When defining a custom protocol which should conform to the `Equatable` protocol then comparing two instances of those protocol references still doesn't work.
Conform to this protocol instead to make it possible to compare two references.

## ConfigLoader

Use a `ConfigLoader` to load a configuration `plist` file and mapping it to its model.

The config file should contain all necessary data to run the app, e.g. server URLs, token IDs, etc.
The config model then provides type-safe properties for the configuration entries.
