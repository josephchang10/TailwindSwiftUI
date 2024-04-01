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

But once you've actually built something this way, you'll quickly notice some really important benefits:

* **Designing with constraints**. Using view modifiers, every value is a magic number. With utilities, you're choosing styles from a predefined **design system**, which makes it much easier to build visually consistent UIs.

* **Responsive design**. You can't use media queries in view modifiers, but you can use Tailwind SwiftUI's **responsive utilities** to build fully responsive interface easily.

* **Hover, focus, and other states**. View modifiers can't target states like hover or focus, but Tailwind SwiftUI's **state variants** make it easy to style these states with utility view modifiers. 

This component is fully responsive and includes a button with hover styles, and is built entirely with utility views and view modifiers:

<img width="412" alt="Screenshot 2024-04-01 at 2 01 58 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/bd51b8e7-fabb-4c14-8138-f396606fbcb2">

<img width="760" alt="Screenshot 2024-04-01 at 2 02 09 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/2794489d-6c6f-487d-8192-d19e323ed822">

```swift
Flex(.small, horizontalSpacing: .s4, verticalSpacing: .s2) {
    AsyncImage(url: .init(string: "https://tailwindcss.com/img/erin-lindford.jpg")) { image in
        image
            .resizable()
            .scaledToFit()
            .height(.s24)
            .rounded(.full)
    } placeholder: {
        ProgressView()
    }
    .accessibilityLabel("Woman's Face")
    VStack(alignment: .leading, spacing: .s3_5) {
        VStack(alignment: .leading, spacing: .s1_5) {
            Text("Erin Lindford")
                .text(.large)
                .foregroundStyle(.black)
                .fontWeight(.semibold)
                .small(otherwise: .width(.full, alignment: .center))
            Text("Product Engineer")
                .foregroundStyle(.slate500)
                .fontWeight(.medium)
                .small(otherwise: .width(.full, alignment: .center))
        }
        Button {} label: {
            Text("Message")
                .padding(.horizontal, .s4)
                .padding(.vertical, .s1)
                .text(.small)
                .hover { content in
                    content
                        .foregroundStyle(.white)
                        .background(.purple600)
                        .ring(.purple600, thickness: .t2, offset: .init(width: .s2))
                        .rounded(.full)
                } otherwise: { content in
                    content
                        .foregroundStyle(.purple600)
                        .border(.purple200, rounded: .full)
                }
                .fontWeight(.semibold)
                .cursorPointer()
        }
        .small(otherwise: .width(.full, alignment: .center))
        .buttonStyle(.plain)
    }
}
.padding(.s8)
.max(width: .small)
.background(.white)
.rounded(.extraLarge)
.shadow(.large)
.main()
```

When you realize how productive you can be working exclusively in SwiftUI with predefined view modifiers, working any other way will feel like torture.
