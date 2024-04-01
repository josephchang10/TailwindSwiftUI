#  Handling Hover, Focus, and Other States

Using utilities to style elements on hover, focus, and more.

Every utility view modifier in Tailwind SwiftUI can be applied *conditionally* by adding a modifier to the beginning of the view modifier that describes the condition you want to target.

For example, to apply the `.background(.sky700)` view modifier on hover, use the `.hover(.background(.sky700))` view modifier:

<img width="520" alt="Screenshot 2024-04-01 at 2 26 54 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/a3e5d952-ddf9-4cbc-bbc9-9a2e9789322a">

![](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/0331eae6-f703-48aa-b7a3-574f9676acbe)

```swift
Button {} label: {
    Text("Save changes")
        ...
        .hover(.background(.sky700), otherwise: .background(.sky500))
        ...
}
```

