# SwiftUI additions

Adds some SwiftUI extensions / additions.

## UIView

### Condition modifier

Run a transform block, but only if the condition is met, otherwise the view remains unchanged:

```
myView.if(X) { $0.padding(8) }
```

Or run one or the the other transform block depending on a condition:

```
myView.if(X) { $0.padding(8) } else: { $0.background(Color.blue) }
```

Or run a transform block when an optional could be successfully unwrapped:

```
myView.ifLet(optionalColor) { $0.foregroundColor($1) }
```

### Frame modifier

Use the frame modifier with a CGSize rather than unwrapping its width and height individually:

```
myView.frame(size: mySize)
```

### View on first appear

Trigger an action when a view appears, but in contrast to `.onAppear` which triggers every time when the view appears including when navigating back to the view, the `.onFirstAppear` triggers only once.

```
myView.onFirstAppear { print("On first appear") }
```
