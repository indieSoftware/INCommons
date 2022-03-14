# UIKit additions

Adds some UIKit extensions / additions.

## UIColor

### Random color

Call `UIColor.random` to create a random color.

### Color from a hex value

Use `UIColor(hex: "ffe700")` to create a solid color from a 6-digit hex string.

Or use a 8-digit hex string to also provide an alpha value (i.e. the same value as before but with a 50% opacity): `UIColor(hex: "FFE70078")`

### SwiftUI's color view

To convert a UIColor to SwiftUI's color view simply call `colorView` on a UIColor instance.

## UIImage

### Image from a UIView

Create a UIImage object from a UIView: `UIImage(view: myView)`.

## UIDevice

### UIDevice injection

Inject a wrapped `UIDevice` object conforming to the `UIDeviceProviderType` protocol to decouple logic code from `UIDevice`. This is useful for UnitTests where you want explicitely define the device's state independent on the device used by the test.

Provided implementations conforming to `UIDeviceProviderType` are `UIDeviceProvider` which wraps the `UIDevice.shared` instance and `UIDeviceProviderMock` which is a mock ready to be used in UnitTests.

Use the accessors on `UIDeviceProviderType`:

- `userInterfaceIdiom` to get the current device's interface type.
- `isSimulator` to check whether the device is a physical or the simulator.
- `deviceOrientation` to get the current device's orientation.

### Force the device into an orinetation

Use `UIDevice.setOrientation(.landscapeRight)` to force the device into a specific orientation (very hacky).

## UIEdgeInsets

### Get NSDirectionalEdgeInsets

To get the `NSDirectionalEdgeInsets` from a `UIEdgeInsets`:

```
var edgeInsets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
let directionalEdgeInsets = edgeInsets.directional
```

### Modify single values from UIEdgeInsets

To only change one edge of a UIEdgeInsets use the following methods:

```
edgeInsets = edgeInsets.top(11)
edgeInsets = edgeInsets.left(22)
edgeInsets = edgeInsets.bottom(33)
edgeInsets = edgeInsets.right(44)
```

### Invert a UIEdgeInsets

Just invert by multiplying all edges with -1: `edgeInsets.inverted()`

