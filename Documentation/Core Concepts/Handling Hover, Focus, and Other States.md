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
        .hover(.background(.sky700), default: .background(.sky500))
        ...
}
```

<details>
    <summary>How does this compare to traditional SwiftUI?</summary>
    
    When writing SwiftUI the traditional way, a `@State` property would be needed to track the hover state and update the view modifier based on the current state.
    
    ❌ Traditionally the hover state would be tracked with a `@State` property and a `onHover` modifier.
    
    ```swift
    @State private var isHovering = false
    
    var body: some View {
        Button {} label: {
            Text("Save changes")
                .background(isHovering ? Color(red: 3 / 255, green: 105 / 255, blue: 161 / 255) : Color(red: 14 / 255, green: 165 / 255, blue: 233 / 255))
        }
        .onHover { hovering in
            isHovering = hovering
        }
    }
    ```
    
    In Tailwind SwiftUI, rather than adding the styles for a hover state to an exsiting view, you can add another view modifier to the element that *only* does something on hover.
    
    ✅ In Tailwind SwiftUI, the `.hover(_, default:)` view modifier is used for the hover state and the default state
    
    ```swift
    .hover(.background(.sky700), default: .background(.sky500))
    ```swift
    
    Notice how `.hover(.background(.sky700), default: .background(.sky500))` defines styles for the hover state and the default state? The background is `.sky500` by default, but as soon as you hover an element with that view modifier, the background will change to `.sky700`.
    
    This is what we mean when we say a utility view modifier can be applied *conditionally* — by using modifiers you can control exactly how your design behaves in different states, without ever tracking states yourself.
</details>

Tailwind SwiftUI includes modifiers for just about everything you'll ever need, including:

* **View modifiers**, like `.hover(_)` and `.focus(_)`.
* **Transforms**, like `.hover(_ hoverTransform:)`.
* **Media and feature queries**, like responsive breakpoints and dark mode.

These modifiers can even be **stacked** to target more specific situations, for example changing the background color in dark mode, at the medium breakpoint, on hover:

```swift
Button {} label: {
    Text("Save changes")
}
.dark(.medium(.hover(.background(.fuchsia600))))
...
```

In this guide you'll learn about every modifier available in the package, how to use them with your own custom views.

---

**View moodifiers**
## Hover, focus, and active

Style elements on hover and focus using the `.hover(_)`, `.focus(_)`, and `.buttonStyle(.active(_))` modifiers:

![Default](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/256139cb-fd77-4e38-812b-f1c6fa6850c5)

![Hover](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/7cda9bc9-da23-452a-9cf9-bfb32680b754)

![Active](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/d8b9f555-9c50-4c75-9231-c3c04d446e85)

```swift
Button {} label: {
    Text("Save changes")
}
.hover(.background(.violet600), default: .background(.violet500))
.buttonStyle(.active(.background(.violet700)))
```


**Form states**

Style form elements in different states using modifiers like `.textFieldStyle(.input(disabled:))`:

<img width="307" alt="Screenshot 2024-04-02 at 1 40 43 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/788af96a-448a-4eee-adf7-453d1827aa0d">

<img width="305" alt="Screenshot 2024-04-02 at 1 40 57 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/4f850867-b05e-480a-9977-d225c7e6b004">

```swift
Form {
    VStack(alignment: .leading, spacing: 0) {
        Text("Username")
            .text(.small)
            .fontWeight(.medium)
            .foregroundStyle(.slate700)
        TextField("", text: .constant("tbone"))
            .textFieldStyle(.input([.padding(.horizontal, .s1), .padding(.vertical, .s2)], default: [.border(.slate300, rounded: .medium), .shadow(.small)], disabled: [.background(.slate50), .foregroundStyle(.slate500), .border(.slate200, rounded: .medium)]))
            .background(.white)
            .padding(.top, .s1)
            .width(.full)
            .small(.text(.small))
            .disabled(true)
    }
    VStack(alignment: .leading, spacing: 0) {
        Text("Password")
            .text(.small)
            .fontWeight(.medium)
            .foregroundStyle(.slate700)
        SecureField("", text: $password)
            .textFieldStyle(.input([.padding(.horizontal, .s1), .padding(.vertical, .s2), .shadow(.small)], default: [.border(.slate300, rounded: .medium), .ring(thickness: .t0)], focused: [.border(.sky500, rounded: .medium), .ring(.sky500, thickness: .t1, rounded: .medium)]))
            .background(.white)
            .padding(.top, .s1)
            .width(.full)
            .small(.text(.small))
    }
    .padding(.top, .s6)
    // ...
}
```

Using modifiers for this sort of thing can reduce the amount of conditional logic in your templates, letting you use the same set of view modifiers regardless of what state an input is in.


**Styling based on parent state (.group{Modifier})

When you need to style an element based on the state of some *parent* element, mark the parent with the `.group()` view modifier, and use `.group*(_:)` modifiers like `.groupHover(_:)` to style the target element:

```swift
Link(destination: .init(string: "#")!) {
    VStack(alignment: .leading, spacing: .s3) {
        HStack(spacing: .s3) {
            Image(systemName: "folder.badge.plus")
                .groupHover(.foregroundStyle(.white))
                .foregroundStyle(.sky500)
            Text("New project")
                .groupHover(.foregroundStyle(.white))
                .foregroundStyle(.slate900)
                .text(.small)
                .fontWeight(.semibold)
        }
        Text("Create a new project from a variety of starting templates.")
            .groupHover(.foregroundStyle(.white))
            .foregroundStyle(.slate500)
            .text(.small)
            .multilineTextAlignment(.leading)
    }
}
.padding(.s6)
.max(width: .extraSmall)
.group()
.hover(.background(.sky500))
.background(.white)
.hover(.ring(.sky500, thickness: .t1, rounded: .large), default: .ring(.slate900 / 5, thickness: .t1, rounded: .large))
.rounded(.large)
.shadow(.large)
```
