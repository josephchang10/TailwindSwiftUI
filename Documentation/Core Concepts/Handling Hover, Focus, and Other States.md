#  Handling Hover, Focus, and Other States

Using utilities to style elements on hover, focus, and more.

Every utility view modifier in Tailwind SwiftUI can be applied *conditionally* by adding a modifier to the beginning of the view modifier that describes the condition you want to target.

For example, to apply the `.background(.sky700)` view modifier on hover, use the `.hover(.background(.sky700))` view modifier:

```swift
Button {} label: {
    Text("Save changes")
        ...
        .hover(.background(.sky700), otherwise: .background(.sky500))
        ...
}
```

