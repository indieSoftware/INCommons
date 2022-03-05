# ShareSheet

Brings support of the `UIActivityViewController` to SwiftUI.

Add the `.activitySheet` modifier and provide an `ActivityItem` instance to show the activity view controller.

### Example usage

```
struct ShareSheet: View {
    @State private var item: ActivityItem?
    
    var body: some View {
        VStack {
            Button("Share") {
                item = ActivityItem(items: [URL(string: "https://www.indie-software.com")!])
            }
        }
        .activitySheet($item)
    }
}

```


