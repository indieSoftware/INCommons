# Swift additions

Adds some Swift extensions / additions.

## Bundle

### Marketing version

Use `Bundle.main.versionNumber` to get the marketing version, e.g. `"1.2.3"`.

### Build number

Use `Bundle.main.buildNumber` to get the build version number, e.g. `"42"`.

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

## Optional

### Stringified

Convert an optional string directly into a string or use a fallback string when the optional is nil:

```
("Foo" as String?).stringified() // "Foo"
(nil as String?).stringified() // ""
(nil as String?).stringified("Fallback") // "Fallback"
```

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

## Global functions

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

