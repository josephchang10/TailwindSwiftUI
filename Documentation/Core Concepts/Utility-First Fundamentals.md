#  Utility-First Fundamentals

Building complex components from a constrained set of primitive utilities.

---

Traditionally, whenever you need to style something on the SwiftUI, you write view modifiers.

**❌ Using a traditional approach where custom designs require custom values.**

<img width="420" alt="Screenshot 2024-03-31 at 4 37 29 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/585936cf-ca12-4bbc-9d6e-d4fe1b441b4c">

```swift
HStack(spacing: 13) {
    Image("logo")
        .resizable()
        .frame(width: 39, height: 39)
    VStack(alignment: .leading) {
        Text("ChitChat")
            .font(.system(size: 16.25))
            .lineSpacing(6.5)
            .fontWeight(.medium)
            .foregroundStyle(.black)
        Text("You have a new message!")
            .foregroundStyle(Color(red: 100 / 255, green: 116 / 255, blue: 139 / 255, opacity: 1))
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}
.padding(20)
.frame(maxWidth: 312)
.background(.white)
.clipShape(RoundedRectangle(cornerRadius: 10))
.background {
    Color.black.opacity(0.1)
        .padding(.horizontal, 3)
        .padding(.vertical, 3)
        .offset(x: 0, y: 10)
        .blur(radius: 15)
}
.background {
    Color.black.opacity(0.1)
        .padding(.horizontal, 4)
        .padding(.vertical, 4)
        .offset(x: 0, y: 4)
        .blur(radius: 6)
}
```

With TailwindSwiftUI, you style elements by applying pre-existing view modifiers directly in your SwiftUI.

**✅ Using utility view modifiers to build custom designs without writing values**

<img width="427" alt="Screenshot 2024-03-31 at 4 05 07 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/26e2b3a2-5e62-4a41-94c4-ec0a8e51138b">

```swift
HStack(spacing: .s4) {
    Image("logo")
        .resizable()
        .width(.s12)
        .height(.s12)
    VStack(alignment: .leading) {
        Text("ChitChat")
            .text(.extraLarge)
            .fontWeight(.medium)
            .foregroundStyle(.black)
        Text("You have a new message!")
            .foregroundStyle(.slate500)
    }
    .width(.full, alignment: .leading)
}
.padding(.s6)
.max(width: .small)
.background(.white)
.rounded(.extraLarge)
.shadow(.large)
```

In the example above, we've used:

* Tailwind SwiftUI's **padding** utilities (`.padding(.s6)`) to control the overall card layout

* The **max-width** utilities (`.max(width:.small)`) to constrain the card width.

* The **border radius**, and **box-shadow** utilities (`.rounded(.extraLarge)`, `.shadow(.large)`) to style the card's appearance

* The **width** and **height** utilities (`.width(.s12)`, `.height(.s12)`) to size the logo image

* The **spacing** utilities (`spacing: .s4`) to handle the spacing between the logo and the text

* The **font size** utilities (`.text(.extraLarge)`) to style the card text

This approach allows us to implement a completely custom component design without writing a single custom value.

Now I know what you're thinking, *"this is an atrocity, what a horrible mess!"* and you're right, it's kind of ugly. In fact it's just about impossible to think this is a good idea the first time you see it -- **you have to actually try it**.

But once you've actually built something this way, you'll quickly notice some really important benefits.

When you realize how productive you can be working exclusively in SwiftUI with predefined view modifiers, working any other way will feel like torture.
