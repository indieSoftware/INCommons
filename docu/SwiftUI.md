# SwiftUI additions

Adds some SwiftUI extensions / additions.

## ClearButton

Provide a customizable SwiftUI clear button to `TextField`s which clears the text field on tap and only appears when editing the field.

```swift
@FocusState var fieldIsFocussed: Bool

TextField(text: $fieldString)
	.focused($fieldIsFocussed)
	.clearButton(
		text: $fieldString,
		isFocused: Binding(
			get: {
				fieldIsFocussed
			}, set: { value in
				fieldIsFocussed = value
			}
		),
		tintColor: .red,
		baseSize: CGSize(width: 20, height: 20),
		tappableSize: CGSize(width: 100, height: 100),
		image: Image(systemName: "x.square.fill")
	)
```

## ColorPickerButton

A custom button looking like Apple's ColorPicker with the gradient colored circle. Especially useful in combination with the `ColorPickerSheet` view-modifier.

```
@State var showColorPicker: Bool = false
@State var selectedColor: Color = .green

ColorPickerButton(color: selectedColor) {
	showColorPicker.toggle()
}
.colorPickerSheet(
	isPresented: $showColorPicker,
	selection: $selectedColor,
	supportsAlpha: false,
	title: "Color Picker",
	animated: true
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

## OverlayWindowPresenter

A helper presenting a view in a new window on top of others.

Helpful to show an error state or something similar on top of the current view hierarchy regardless of the current state and without injecting something to each screen.

```swift
let overlayWindowPresenter = OverlayWindowPresenter()
overlayWindowPresenter.present(
	view: someOverlayView
)
overlayWindowPresenter.dismiss()
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
