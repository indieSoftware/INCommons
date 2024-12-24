# SwiftUI additions

Adds some SwiftUI extensions / additions.

## ClearButton

Provide a customizable SwiftUI clear button to `TextField`s which clears the text field on tap and only appears when editing the field.

```swift
TextField(text: $fieldString)
	.clearButton(
		text: $fieldString,
		tintColor: .red,
		baseSize: CGSize(width: 20, height: 20),
		tappableSize: CGSize(width: 100, height: 100),
		image: Image(systemName: "x.square.fill")
	)
```

## OverlayButton

A view containing a button and an overlay for changing the touch area without modifying the layout of the embedded button.

Usually when adding a button to a view and changing the button's frame size then the button will push the layout. But with an OverlayButton it's possible to increase the touch area of the button without pushing the layout of the view which embedds the button.

The following example will show the checkmark icon in a button with the size of the icon itself, but with a touch area of 44x44.

```swift
OverlayButton(
	action: { print("Button tapped") },
	baseShape: {
		Image(systemName: "checkmark")
	}, 
	decoration: { baseShape in
		baseShape
			.frame(width: 44, height: 44)
	}
)
```

## UIView

### Condition modifier

Run a transform block, but only if the condition is met, otherwise the view remains unchanged:

```swift
myView.if(X) { $0.padding(8) }
```

Or run one or the the other transform block depending on a condition:

```swift
myView.if(X) { $0.padding(8) } else: { $0.background(Color.blue) }
```

Or run a transform block when an optional could be successfully unwrapped:

```swift
myView.ifLet(optionalColor) { $0.foregroundColor($1) }
```

### Frame modifier

Use the frame modifier with a CGSize rather than unwrapping its width and height individually:

```swift
myView.frame(size: mySize)
```

### View on first appear

Trigger an action when a view appears, but in contrast to `.onAppear` which triggers every time when the view appears including when navigating back to the view, the `.onFirstAppear` triggers only once.

```swift
myView.onFirstAppear { print("On first appear") }
```
