# Rapidly build modern apps without ever leaving your SwiftUI.

A utility-first Swift package packed with view modifiers that can be composed to build any design, directly in your SwiftUI code.

**[Get started](Documentation/Getting%20Started/Installation.md)**

<img width="890" alt="Screenshot 2024-03-16 at 3 12 35 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/23cbb02b-a76b-42e8-9e09-69c06e652859">
<img width="485" alt="Screenshot 2024-03-16 at 3 13 45 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/14fb8f8a-439c-4d37-afc6-418f56a8aca8">

```
Flex(.medium) {
    AsyncImage(
        url: .init(string: "https://images.unsplash.com/photo-1706820643404-71812d9d7d3a?w=384"),
        content: { image in
            image
                .resizable()
                .scaledToFill()
        }, placeholder: {
            ProgressView()
        }
    )
    .width(.s24)
    .height(.s24)
    .medium(.width(.s48))
    .medium(.height(.auto))
    .medium(.rounded(.none), otherwise: .rounded(.full))
    VStack(spacing: .scale(.s4)) {
        Group {
            Text("4 Hikers perched a top Wanaka's highest mountain to watch the sun rise in New Zealand's South Island")
                .text(.large)
            VStack {
                Group {
                    Text("Nick Da Fonseca")
                        .foregroundStyle(.sky500)
                        .dark(.foregroundStyle(.sky400))
                    Text("Roys Peak, Wānaka, New Zealand")
                        .dark(.foregroundStyle(.slate500), otherwise: .foregroundStyle(.slate700))
                }
                .medium(.frame(maxWidth: .infinity, alignment: .leading))
            }
        }
        .medium(.frame(maxWidth: .infinity, alignment: .leading))
        .medium(.multilineTextAlignment(.leading), otherwise: .multilineTextAlignment(.center))
        .fontWeight(.medium)
    }
    .medium(.padding(.s8), otherwise: .padding(.top, .s6))
}
.medium(.padding(.s0), otherwise: .padding(.s8))
.background(.slate100)
.dark(.background(.slate800))
.rounded(.extraLarge)
```


![constraint-based c6eb530e](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/928be8f6-3673-4228-a3cc-9b05c41be0ab)

**Constraint-based**
## An API for your design system.

Utility view modifiers help your work within the constraints of a system instead of littering your SwiftUI with arbitrary values. They make it easy to be consistent with color choices, spacing, typography, shadows, and everything else that makes up a well-engineered design system.

![3ya51rqm6zqlttt745s-5](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/b0862a08-e566-4501-a2d8-d0644889bf59)

**Sizing**

<img width="404" alt="Screenshot 2024-03-16 at 4 19 39 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/f48ebe9b-a0c3-4fc8-9058-987ff165ca8e">

```swift
VStack(alignment: .leading, spacing: .scale(.s4)) {
    Group {
        Text(".width(.s96)")
            .width(.s96)
        Text(".width(.s80)")
            .width(.s80)
        Text(".width(.s72)")
            .width(.s72)
        Text(".width(.s64)")
            .width(.s64)
        Text(".width(.s60)")
            .width(.s60)
        Text(".width(.s56)")
            .width(.s56)
        Text(".width(.s52)")
            .width(.s52)
        Text(".width(.s48)")
            .width(.s48)
        Text(".width(.s44)")
            .width(.s44)
        Text(".width(.s40)")
            .width(.s40)
        Text(".width(.s36)")
            .width(.s36)
    }
    .background(.white)
    .rounded()
    .shadow()
}
```

![Colors](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/acde5c9c-836f-4ac9-a397-d315bfe42644)

**Colors**

<img width="408" alt="Screenshot 2024-03-16 at 5 08 20 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/a637263e-b790-4f87-b819-5a3f497be56b">

```swift
LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: .scale(.s2)), count: 10)) {
    Group {
        Color.sky50
        Color.sky100
        Color.sky200
        Color.sky300
        Color.sky400
        Color.sky500
        Color.sky600
        Color.sky700
        Color.sky800
        Color.sky900
    }
    .aspectRatio(1, contentMode: .fit)
}
LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: .scale(.s2)), count: 10)) {
    Group {
        Color.blue50
        Color.blue100
        Color.blue200
        Color.blue300
        Color.blue400
        Color.blue500
        Color.blue600
        Color.blue700
        Color.blue800
        Color.blue900
    }
    .aspectRatio(1, contentMode: .fit)
}
LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: .scale(.s2)), count: 10)) {
    Group {
        Color.indigo50
        Color.indigo100
        Color.indigo200
        Color.indigo300
        Color.indigo400
        Color.indigo500
        Color.indigo600
        Color.indigo700
        Color.indigo800
        Color.indigo900
    }
    .aspectRatio(1, contentMode: .fit)
}
LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: .scale(.s2)), count: 10)) {
    Group {
        Color.violet50
        Color.violet100
        Color.violet200
        Color.violet300
        Color.violet400
        Color.violet500
        Color.violet600
        Color.violet700
        Color.violet800
        Color.violet900
    }
    .aspectRatio(1, contentMode: .fit)
}
```

![Typography](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/6a1c8fce-3de3-489c-b900-221963f514c1)

**Typography**

<img width="453" alt="Screenshot 2024-03-16 at 5 41 05 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/afcf4697-1fbd-43eb-b2e5-be72c572b490">

```swift
VStack(alignment: .leading, spacing: .scale(.s5)) {
    Group {
        VStack(alignment: .leading) {
            Text(".fontDesign(.default)")
                .text(.small)
                .border(.bottom)
            Text("The quick brown fox jumps over the lazy dog.")
                .fontDesign(.default)
        }
        VStack(alignment: .leading) {
            Text(".fontDesign(.serif)")
                .text(.small)
                .border(.bottom)
            Text("The quick brown fox jumps over the lazy dog.")
                .fontDesign(.serif)
        }
        VStack(alignment: .leading) {
            Text(".fontDesign(.monospaced)")
                .text(.small)
                .border(.bottom)
            Text("The quick brown fox jumps over the lazy dog.")
                .fontDesign(.monospaced)
        }
    }
    .padding(.s3)
    .background(.white)
    .rounded(.large)
    .shadow()
}
```

![Shadows](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/e0168f7d-f50c-4a44-9bda-389dbfc7adf5)

**Shadows**

<img width="502" alt="Screenshot 2024-03-17 at 10 43 06 AM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/9aa939c3-2705-446c-a6b7-4135b52e3b41">

```swift
LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: .scale(.s4)), count: 2), spacing: .scale(.s6)) {
    Group {
        Text(".shadow(.small)")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .background(.white)
            .rounded(.large)
            .boxShadow(.small)
        Text(".shadow()")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .background(.white)
            .rounded(.large)
            .boxShadow()
        Text(".shadow(.medium)")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .background(.white)
            .rounded(.large)
            .boxShadow(.medium)
        Text(".shadow(.large)")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .background(.white)
            .rounded(.large)
            .boxShadow(.large)
        Text(".shadow(.extraLarge)")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .background(.white)
            .rounded(.large)
            .boxShadow(.extraLarge)
        Text(".shadow(.extraLarge2)")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            .background(.white)
            .rounded(.large)
            .boxShadow(.extraLarge2)
    }
    .height(.s20)
}
```

![build-anything d8e81ea3](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/06e505cc-acbf-4094-a195-c25587234db3)

**Build anything**

## Build whatever you want, seriously.

![Simple](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/6f66de33-6078-4585-869a-5659b4a76180)

**Simple**

<img width="526" alt="Screenshot 2024-03-17 at 4 55 56 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/e8589f59-9834-4bb8-abff-c7b2977fb51c">

```
HStack {
    AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1708443683202-a5be0ced5b8b")) { image in
        image
            .resizable()
            .scaledToFill()
    } placeholder: {
        ProgressView()
    }
    .width(.s48)
    .height(.full)
    .clipped()
    Form {
        HStack {
            Text("Pullover Hoodie")
                .text(.large)
                .fontWeight(.semibold)
                .foregroundStyle(.slate900)
                .width(.full, alignment: .leading)
            Text("$110.00")
                .text(.large)
                .fontWeight(.semibold)
                .foregroundStyle(.slate500)
        }
        Text("In stock")
            .width(.full, alignment: .leading)
            .text(.small)
            .fontWeight(.medium)
            .foregroundStyle(.slate700)
            .padding(.top, .s2)
        HStack(alignment: .firstTextBaseline, spacing: .scale(.s2)) {
            ForEach(["XS", "S", "M", "L", "XL"], id: \.self) { size in
                Button {
                    selectedSize = size
                } label: {
                    Text(size)
                        .width(.s9)
                        .height(.s9)
                        .if(selectedSize == size) { view in
                            view
                                .fontWeight(.medium)
                                .background(.slate900)
                                .foregroundStyle(.white)
                        } or: { view in
                            view
                                .foregroundStyle(.slate700)
                        }
                        .rounded(.large)
                }
                .accessibilityLabel("\(size) size")
                .accessibilityValue(selectedSize == size ? "selected" : "not selected")
                .buttonStyle(.plain)
            }
        }
        .text(.small)
        .padding(.bottom, .s6)
        .border(.slate200, .bottom)
        .padding(.top, .s4)
        .padding(.bottom, .s6)
        HStack(spacing: .scale(.s4)) {
            HStack(spacing: .scale(.s4)) {
                Button("Buy now") {}
                    .height(.s10)
                    .padding(.horizontal, .s6)
                    .background(.black)
                    .foregroundStyle(.white)
                    .rounded(.medium)
                    .buttonStyle(.plain)
                Button("Add to bag") {}
                    .height(.s10)
                    .padding(.horizontal, .s6)
                    .border(.slate200, rounded: .medium)
                    .foregroundStyle(.slate900)
                    .buttonStyle(.plain)
            }
            .fontWeight(.semibold)
            .width(.full, alignment: .leading)
            Button {} label: {
                Image(systemName: "heart.fill")
            }
            .width(.s9)
            .height(.s9)
            .foregroundStyle(.slate300)
            .border(.slate200, rounded: .medium)
            .accessibilityLabel("Like")
            .buttonStyle(.plain)
        }
        .padding(.bottom, .s6)
        .text(.small)
        .fontWeight(.medium)
        Text("Free shipping on all continental US orders.")
            .text(.small)
            .foregroundStyle(.slate700)
    }
    .padding(.s6)
    .width(.full)
}
```

![Playful](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/9b407cee-3e39-4c51-8f89-d426880fb17b)

**Playful**

<img width="564" alt="Screenshot 2024-03-17 at 4 59 33 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/09c4ccf0-642e-497c-87b6-af025af25737">

```swift
HStack {
    AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1568385247005-0d371d214a2c")) { image in
        image
            .resizable()
            .scaledToFill()
    } placeholder: {
        ProgressView()
    }
    .width(.s56)
    .height(.full)
    .rounded(.large)
    Form {
        HStack {
            Text("Kids Dress")
                .width(.full, alignment: .leading)
                .fontWeight(.medium)
                .foregroundStyle(.slate900)
            Text("In stock")
                .text(.small)
                .fontWeight(.medium)
                .foregroundStyle(.slate400)
        }
        Text("$39.00")
            .padding(.top, .s2)
            .text(.extraLarge3)
            .fontWeight(.bold)
            .foregroundStyle(.violet600)
        HStack(alignment: .firstTextBaseline, spacing: .scale(.s2)) {
            ForEach(["XS", "S", "M", "L", "XL"], id: \.self) { size in
                Button {
                    selectedSize = size
                } label: {
                    Text(size)
                        .width(.s9)
                        .height(.s9)
                        .if(selectedSize == size) { view in
                            view
                                .fontWeight(.medium)
                                .background(.violet600)
                                .foregroundStyle(.white)
                        } or: { view in
                            view
                                .foregroundStyle(.violet400)
                        }
                        .rounded(.full)
                }
                .accessibilityLabel("\(size) size")
                .accessibilityValue(selectedSize == size ? "selected" : "not selected")
                .buttonStyle(.plain)
            }
        }
        .text(.small)
        .fontWeight(.bold)
        .padding(.bottom, .s6)
        .border(.slate200, .bottom)
        .padding(.top, .s4)
        .padding(.bottom, .s6)
        HStack(spacing: .scale(.s4)) {
            HStack(spacing: .scale(.s4)) {
                Button("Buy now") {}
                    .height(.s10)
                    .padding(.horizontal, .s6)
                    .background(.violet600)
                    .foregroundStyle(.white)
                    .rounded(.full)
                    .buttonStyle(.plain)
                Button("Add to bag") {}
                    .height(.s10)
                    .padding(.horizontal, .s6)
                    .border(.slate200, rounded: .full)
                    .foregroundStyle(.slate900)
                    .buttonStyle(.plain)
            }
            .fontWeight(.semibold)
            .width(.full, alignment: .leading)
            Button {} label: {
                Image(systemName: "heart.fill")
            }
            .width(.s9)
            .height(.s9)
            .foregroundStyle(.violet600)
            .background(.violet50)
            .rounded(.full)
            .accessibilityLabel("Like")
            .buttonStyle(.plain)
        }
        .padding(.bottom, .s5)
        .text(.small)
        .fontWeight(.medium)
        Text("Free shipping on all continental US orders.")
            .text(.small)
            .foregroundStyle(.slate500)
    }
    .padding(.s6)
    .width(.full)
}
```

![Elegant](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/caa20d48-3784-4dd4-a74f-710306946318)

**Elegant**

<img width="499" alt="Screenshot 2024-03-18 at 7 53 25 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/73aa06fb-37f2-4d42-b936-2dfe93c02abb">

```swift
HStack {
    AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1559034750-cdab70a66b8e")) { image in
        image
            .resizable()
            .scaledToFill()
    } placeholder: {
        ProgressView()
    }
    .width(.s52)
    .height(.full)
    .clipped()
    Form {
        Text("Formal Strapless Gown")
            .text(.extraLarge2, leading: nil)
            .padding(.bottom, .s3)
            .foregroundStyle(.slate900)
        HStack(alignment: .firstTextBaseline) {
            Text("$350.00")
                .width(.full, alignment: .leading)
                .text(.large)
                .fontWeight(.medium)
                .foregroundStyle(.slate500)
            Text("In stock")
                .text(.extraSmall, leading: .s6)
                .fontWeight(.medium)
                .textCase(.uppercase)
                .foregroundStyle(.slate500)
        }
        HStack(alignment: .firstTextBaseline, spacing: .scale(.s1)) {
            ForEach(["XS", "S", "M", "L", "XL"], id: \.self) { size in
                Button {
                    selectedSize = size
                } label: {
                    Text(size)
                        .width(.s7)
                        .height(.s7)
                        .if(selectedSize == size) { view in
                            view
                                .fontWeight(.medium)
                                .background(.slate100)
                                .foregroundStyle(.slate900)
                        } or: { view in
                            view
                                .foregroundStyle(.slate500)
                        }
                        .rounded(.full)
                }
                .accessibilityLabel("\(size) size")
                .accessibilityValue(selectedSize == size ? "selected" : "not selected")
                .buttonStyle(.plain)
            }
        }
        .text(.small)
        .fontWeight(.medium)
        .padding(.bottom, .s6)
        .border(.slate200, .bottom)
        .padding(.top, .s4)
        .padding(.bottom, .s6)
        HStack(spacing: .scale(.s4)) {
            HStack(spacing: .scale(.s4)) {
                Button("Buy now") {}
                    .width(.full)
                    .height(.s12)
                    .background(.slate900)
                    .foregroundStyle(.white)
                    .buttonStyle(.plain)
                Button("Add to bag") {}
                    .width(.full)
                    .height(.s12)
                    .border(.slate200)
                    .foregroundStyle(.slate900)
                    .buttonStyle(.plain)
            }
            .textCase(.uppercase)
            .fontWeight(.medium)
            .kerning(.wider)
            .width(.full)
            .padding(.trailing, .s4)
            Button {} label: {
                Image(systemName: "heart.fill")
            }
            .width(.s12)
            .height(.s12)
            .foregroundStyle(.slate300)
            .border(.slate200)
            .accessibilityLabel("Like")
            .buttonStyle(.plain)
        }
        .padding(.bottom, .s5)
        .text(.small)
        .fontWeight(.medium)
        Text("Free shipping on all continental US orders.")
            .text(.small)
            .foregroundStyle(.slate500)
    }
    .padding(.s6)
    .width(.full)
}
.fontDesign(.serif)
```

![Brutalist](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/c9b626a4-42d3-4393-9489-3891ac1f4d60)

**Brutalist**

<img width="578" alt="Screenshot 2024-03-18 at 11 03 16 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/594421a6-b168-44c8-b613-2cb824e9dca0">

```swift
HStack {
    AsyncImage(url: .init(string: "https://images.unsplash.com/photo-1593169158019-e33d5a325c4c")) { image in
        image
            .resizable()
            .scaledToFill()
            .frame(width: 148, height: 200)
            .clipped()
            .background {
                Color.teal400
                    .top(.s1)
                    .left(.s1)
                    .bottom(.n1)
                    .right(.n1)
            }
    } placeholder: {
        ProgressView()
    }
    .width(.s48)
    .padding(.bottom, .s10)
    .zIndex(10)
    Form {
        VStack {
            Text("Retro Shoe")
                .width(.full, alignment: .leading)
                .text(.extraLarge2)
                .padding(.bottom, .s2)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            HStack(alignment: .firstTextBaseline) {
                Text("$350.00")
                    .text(.large)
                    .foregroundStyle(.white)
                Text("In stock")
                    .textCase(.uppercase)
                    .foregroundStyle(.teal400)
                    .padding(.leading, .s3)
            }
            .width(.full, alignment: .leading)
        }
        .padding(.bottom, .s6)
        .background(
            Color.black
                .top(.n6)
                .left(.n64)
                .right(.n6)
        )
        HStack(alignment: .firstTextBaseline, spacing: .scale(.s3)) {
            ForEach(["XS", "S", "M", "L", "XL"], id: \.self) { size in
                Button {
                    selectedSize = size
                } label: {
                    Text(size)
                        .width(.s10)
                        .height(.s10)
                        .if(selectedSize == size) { view in
                            view
                                .background(.black)
                                .foregroundStyle(.white)
                                .background {
                                    Color.teal400
                                        .top(.s0_5)
                                        .left(.s0_5)
                                        .bottom(.n0_5)
                                        .right(.n0_5)
                                }
                        } or: { view in
                            view
                                .foregroundStyle(.black)
                        }
                }
                .accessibilityLabel("\(size) size")
                .accessibilityValue(selectedSize == size ? "selected" : "not selected")
                .buttonStyle(.plain)
            }
        }
        .text(.small)
        .fontWeight(.medium)
        .padding(.vertical, .s6)
        HStack(spacing: .scale(.s2)) {
            HStack(spacing: .scale(.s4)) {
                Button("Buy now") {}
                    .padding(.horizontal, .s6)
                    .height(.s12)
                    .border(.black, width: 2)
                    .background(.teal400)
                    .foregroundStyle(.black)
                Button("Add to bag") {}
                    .padding(.horizontal, .s6)
                    .height(.s12)
                    .border(.slate200)
                    .foregroundStyle(.slate900)
            }
            .textCase(.uppercase)
            .fontWeight(.semibold)
            .kerning(.wider)
            Button {} label: {
                Image(systemName: "heart.fill")
            }
            .width(.s12)
            .height(.s12)
            .foregroundStyle(.black)
            .accessibilityLabel("Like")
        }
        .padding(.bottom, .s4)
        .text(.small)
        .fontWeight(.medium)
        .buttonStyle(.plain)
        Text("Free shipping on all continental US orders.")
            .text(.extraSmall, leading: .s6)
            .foregroundStyle(.slate500)
    }
    .padding(.leading, .s6)
    .width(.full)
}
.fontDesign(.monospaced)
```

![mobile-first b61c76c9](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/050573ea-32cd-491c-b28d-0787c882fc57)

**Mobile-first**
## Responsive everything.
Tailwind SwiftUI lets you build responsive designs right in your SwiftUI.

Throw a screen size in front of literally any view modifier and watch it magically apply at a specific breakpoint.

<img width="431" alt="Screenshot 2024-03-25 at 4 00 56 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/8f4cacab-6076-4f4e-a25c-f49baf597ecd">

`Small`

<img width="781" alt="Screenshot 2024-03-25 at 4 01 30 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/26507a61-4a3b-4cd4-b4ce-8fff6bebd047">

`Medium`

<img width="1005" alt="Screenshot 2024-03-25 at 4 01 56 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/0dc0cc89-800a-4df5-b88e-170e4f4a84a4">

`Large`

<img width="1283" alt="Screenshot 2024-03-25 at 4 02 09 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/2a01b0f1-9507-4edb-949e-8c96e8ad4f3d">

```swift
var body: some View {
    Main {
        ZStack {
            HStack {
                GridView {
                    Large{} otherwise: {
                        ZStack {
                            images
                            Small {} otherwise: {
                                property
                            }
                        }
                        .rounded(.large)
                    }
                    HStack {
                        VStack {
                            Small {
                                property
                            }
                            HStack {
                                HStack(spacing: 0) {
                                    Image(systemName: "star.fill")
                                        .padding(.trailing, .s1)
                                        .dark(.foregroundStyle(.indigo500))
                                    Text("4.89 ")
                                    Text("(128)")
                                        .foregroundStyle(.slate400)
                                }
                                .accessibilityLabel("Reviews")
                                .foregroundStyle(.indigo600)
                                HStack {
                                    Circle()
                                        .frame(width: 2)
                                        .padding(.horizontal, .s3)
                                        .foregroundStyle(.slate300)
                                    Image(systemName: "mappin.circle")
                                        .padding(.trailing, .s1)
                                        .dark(.foregroundStyle(.slate500), otherwise: .foregroundStyle(.slate400))
                                    Text("Santa Teresa, ES")
                                }
                                .accessibilityLabel("Location")
                            }
                            .small(.padding(.top, .s1), otherwise: .padding(.top, .s4))
                            .text(.small)
                            .fontWeight(.medium)
                            .width(.full, alignment: .leading)
                        }
                        Small {
                            Large {} otherwise: {
                                checkAvailability
                            }
                        }
                    }
                    Small {
                        Large {
                            checkAvailability
                        }
                    } otherwise: {
                        checkAvailability
                    }
                    Text("Discover tranquility in our Cozy Cabin Retreat, nestled in the heart of Santa Teresa, ES, Brazil. This A-frame sanctuary offers stunning mountain views and a unique blend of rustic charm and modern comfort. Perfect for relaxation seekers, our cabin is surrounded by nature yet close to local cafes and cultural spots. Ideal for a serene getaway or a nature-filled adventure.")
                        .large(.padding(.top, .s6), otherwise: .padding(.top, .s4))
                        .text(.small, leading: 6)
                        .width(.full, alignment: .leading)
                        .dark(.foregroundStyle(.slate400))
                }
                .large(.padding(.trailing, .s20))
                Large {
                    images
                }
            }
            .large(.max(width: .extraLarge5), otherwise: .max(width: .extraLarge4))
        }
        .medium(.padding(.vertical, .s10), otherwise: .padding(.vertical, .s6))
        .medium(.padding(.horizontal, .s8), otherwise: .small(.padding(.horizontal, .s6), otherwise: .padding(.horizontal, .s4)))
        .width(.full, alignment: .center)
    }
    .dark(.foregroundStyle(.slate400), otherwise: .foregroundStyle(.slate500))
    .background(.white)
}

var property: some View {
    VStack(alignment: .leading) {
        Text("Entire house")
            .text(.small, leading: 4)
            .fontWeight(.medium)
        Text("Cabin Retreat in Santa Teresa")
            .padding(.top, .s1)
            .text(.large)
            .fontWeight(.semibold)
    }
    .small(.foregroundStyle(.slate900), otherwise: .foregroundStyle(.white))
    .small(otherwise: .padding(.s3))
    .width(.full, alignment: .leading)
    .small(otherwise: .height(.s60, alignment: .bottomLeading))
    .small(.background(.clear), otherwise: .backgroundGradient(to: .right, from: .black / 75, via: .black / 0))
}

var checkAvailability: some View {
    Button {} label: {
        Text("Check availability")
            .foregroundStyle(.white)
            .text(.small, leading: 6)
            .fontWeight(.medium)
            .padding(.vertical, .s2)
            .padding(.horizontal, .s3)
            .background(.indigo600)
            .rounded(.large)
    }
    .small(.large(.padding(.top, .s6)), otherwise: .padding(.top, .s4))
    .small(.large(.width(.full, alignment: .leading), otherwise: .width(.full, alignment: .trailing)), otherwise: .width(.full, alignment: .leading))
    .buttonStyle(.plain)
}

var images: some View {
    GridView(smallCols: 4, .gap(.s4), large: .gap(.s6)) {
        Image("CabinRetreat")
            .resizable()
            .scaledToFill()
            .small(.height(.s52), otherwise: .height(.s60))
            .rounded(.large)
            .small(.col(span: 2))
            .large(.col(span: .full))
        Group {
            Object(.cover) {
                Image("CabinRetreatInterior")
                .resizable()
            }
            .large(.col(span: 2), otherwise: .medium(.col(span: 1), otherwise: .col(span: 2)))
            .small(.height(.s52), otherwise: .height(.s0))
            .large(.height(.s32))
            Object(.cover) {
                Image("CabinRetreatExterior")
                .resizable()
            }
            .medium(.height(.s52), otherwise: .height(.s0))
            .large(.height(.s32))
            .large(.col(span: 2))
        }
        .rounded(.large)
    }
    .large(.padding(.bottom, .s0), otherwise: .small(.padding(.bottom, .s6)))
}
```

![state-variants 85fa7325](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/17d5fa66-6f19-493f-9880-5157ec87a18d)

**State variants**

## Hover and focus states? We got'em.

![](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/a8adfbe6-ee77-4344-99e0-be8a200d9dfa)

![](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/0b6c7b1e-2ed6-4f08-8b8e-57f9c15cf1dc)

![](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/3d7b8ffb-9c2f-49ed-ae69-d79a52b9631d)

![](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/83079d48-bb51-48a5-a2c0-4398fc742ba0)

![](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/c3e057e6-139f-4672-a20d-03bece34d22a)

```swift
List {
    Section {
        VStack(spacing: .s4) {
            ForEach(projects) { project in
                Link(destination: project.url) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(project.title)
                                .accessibilityLabel("Title")
                                .fontWeight(.semibold)
                                .groupHover(.foregroundStyle(.white), otherwise: .foregroundStyle(.slate900))
                            Text(project.category)
                                .accessibilityLabel("Category")
                                .groupHover(.foregroundStyle(.blue200))
                        }
                        HStack(spacing: -.s1_5) {
                            ForEach(project.users) { user in
                                AsyncImage(url: user.avatar) { image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .accessibilityLabel(user.name)
                                .scaledToFill()
                                .width(.s6)
                                .height(.s6)
                                .background(.slate100)
                                .rounded(.full)
                                .ring(.white, thickness: .t2, rounded: .full)
                            }
                        }
                        .accessibilityLabel("Users")
                        .justifyEnd()
                    }
                }
                .padding(.s3)
                .cursorPointer()
                .hover(.background(.blue500), otherwise: .background(.white))
                .rounded(.medium)
                .ring(.slate200, thickness: .t1, rounded: .medium)
                .shadow(.small)
                .group()
            }
            Link(destination: .init(string: "/new")!) {
                VStack {
                    Image(systemName: "plus")
                        .padding(.bottom, .s1)
                        .groupHover(.foregroundStyle(.blue500), otherwise: .foregroundStyle(.slate400))
                    Text("New Project")
                }
            }
            .width(.full)
            .padding(.vertical, .s3)
            .group()
            .hover { view in
                view
                    .border(.solid, .blue500, width: 2, rounded: .medium)
                    .background(.white)
                    .foregroundStyle(.blue500)
            } otherwise: { view in
                view
                    .border(.dashed, .slate300, width: 2, rounded: .medium)
            }
            .text(.small, leading: 6)
            .foregroundStyle(.slate900)
            .fontWeight(.medium)
            .cursorPointer()
        }
        .padding(.s4)
        .text(.small, leading: 6)
    } header: {
        VStack(spacing: .scale(.s4)) {
            HStack {
                Text("Projects")
                    .fontWeight(.semibold)
                    .foregroundStyle(.slate900)
                Spacer()
                Link(destination: .init(string: "/new")!) {
                    Image(systemName: "plus")
                        .padding(.trailing, .s2)
                    Text("New")
                }
                .padding(.leading, .s2)
                .padding(.trailing, .s3)
                .padding(.vertical, .s2)
                .hover(.background(.blue400), otherwise: .background(.blue500))
                .rounded(.medium)
                .foregroundStyle(.white)
                .text(.small)
                .fontWeight(.medium)
                .shadow(.small)
            }
            Form {
                HStack(spacing: 0) {
                    Image(systemName: "magnifyingglass")
                        .if(isFocused, then: { image in
                            image
                                .foregroundStyle(.blue500)
                        }, or: { image in
                            image
                                .dark(.foregroundStyle(.slate500), otherwise: .foregroundStyle(.slate400))
                        })
                        .padding(.leading, .s3)
                    TextField("", text: .constant(""), prompt: Text("Filter projects...")
                        .foregroundStyle(.slate400)
                    )
                    .focused($isFocused)
                    .textFieldStyle(.plain)
                    .height(.s6)
                    .foregroundStyle(.slate900)
                    .padding(.vertical, .s2)
                    .accessibilityLabel("Filter projects")
                }
                .rounded(.medium)
                .ring(isFocused: isFocused, focus: .blue500, thickness: .t2, otherwise: .slate200, thickness: .t1, rounded: .medium)
                .background(.white)
                .compositingGroup()
                .shadow(.small)
            }
        }
        .padding(.s4)
        .background(.white)
    }
    .listRowSeparator(.hidden)
}
.background(.slate50)
.foregroundStyle(.slate500)
```

![component-driven 82a66c3c](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/885a32e1-6e20-44ef-8454-1cd8d369c529)

**Component-driven**

## Worried about duplication? Don’t be.

<img width="571" alt="image" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/c52a4d78-e7b9-474f-a12b-86996ebe9920">

MoviesView.swift

---
```swift
import SwiftUI
import TailwindSwiftUI

struct MoviesView: View {
    var body: some View {
        VStack(spacing: 0) {
            Divide(.slate100) {
                NavigationView {
                    NavigationItem(url: .init(string: "/new")!, isActive: true) {
                        Text("New Releases")
                    }
                    NavigationItem(url: .init(string: "/top")!, isActive: false) {
                        Text("Top Rated")
                    }
                    NavigationItem(url: .init(string: "/picks")!, isActive: false) {
                        Text("Vincent's Picks")
                    }
                }
                ListView {
                    ForEach(movies, id: \.id) { movie in
                        ListItem(movie: movie)
                    }
                }
            }
        }
        .foregroundStyle(.slate500)
        .background(.white)
    }
}
```

NavigationView.swift

---

```swift
import SwiftUI

struct NavigationView<Content: View>: View {
    let content: Content
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: .s3) {
                content
            }
        }
        .padding(.all, .s6)
        .text(.small)
        .fontWeight(.medium)
    }
    
    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
}
```

NavigationItem.swift

---

```swift
import SwiftUI

struct NavigationItem<Content: View>: View {
    let url: URL
    let isActive: Bool
    let content: Content
    
    var body: some View {
        Link(destination: url) {
            content
        }
        .padding(.horizontal, .s3)
        .padding(.vertical, .s2)
        .if(isActive) { view in
            view
                .background(.sky500)
                .foregroundStyle(.white)
        } or: { view in
            view
                .background(.slate50)
        }
        .rounded(.medium)
        .cursorPointer()
    }
    
    init(url: URL, isActive: Bool, @ViewBuilder _ content: () -> Content) {
        self.url = url
        self.isActive = isActive
        self.content = content()
    }
}
```

ListView.swift

---

```swift
import SwiftUI

struct ListView<Content: View>: View {
    let content: Content
    
    var body: some View {
        List {
            content
                .listRowSeparatorTint(.slate100)
        }
        .listStyle(.plain)
    }
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}
```

ListItem.swift

---

```swift
import SwiftUI

struct ListItem: View {
    let movie: Movie
    
    var body: some View {
        HStack(spacing: .s6) {
            Image(movie.image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 88)
                .background(.slate100)
                .rounded(.medium)
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(movie.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.slate900)
                        .padding(.trailing, .s20)
                    Spacer()
                    HStack(spacing: .s1) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.sky500)
                        Text(movie.starRating.description)
                    }
                }
                HStack(spacing: 0) {
                    Text(movie.rating)
                        .accessibilityLabel("Rating")
                        .padding(.s1_5)
                        .ring(.slate200, thickness: .t1, rounded: .notSpecific)
                    Text(movie.year.description)
                        .accessibilityLabel("Year")
                        .padding(.leading, .s2)
                    HStack(spacing: 0) {
                        Circle()
                            .frame(width: 2)
                            .padding(.horizontal, .s2)
                            .foregroundStyle(.slate300)
                            .accessibilityHidden(true)
                        Text(movie.genre)
                    }
                    .accessibilityLabel("Genre")
                    HStack(spacing: 0) {
                        Circle()
                            .frame(width: 2)
                            .padding(.horizontal, .s2)
                            .foregroundStyle(.slate300)
                            .accessibilityHidden(true)
                        Text(String(format: "%dh %dm", movie.runTime / 60, movie.runTime % 60))
                    }
                    .accessibilityLabel("Runtime")
                }
                .padding(.top, .s2)
                .text(.small, leading: 6)
                .fontWeight(.medium)
                Text(movie.cast)
                    .padding(.top, .s2)
                    .font(.body)
                    .accessibilityLabel("Cast")
                    .foregroundStyle(.slate400)
            }
            .frame(minWidth: 0)
        }
        .padding(.s6)
    }
}
```

![dark-mode 12db1733](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/bcb47852-988a-4caa-8b2e-2e66e2947cac)

**Dark mode**

## Dark Mode.

![Light](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/dad44b4d-34c5-45be-9651-4b02fa809ea4)

<img width="603" alt="Screenshot 2024-03-30 at 3 54 32 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/a6c1d890-0c9b-490d-861b-5ae2feeef424">

![Dark](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/b46ec2d3-35a3-4908-a432-e1f928f47a06)

<img width="603" alt="Screenshot 2024-03-30 at 3 55 11 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/a5fa1db3-7af3-4b6f-8544-b090e2acb228">

```swift
VStack(spacing: 0) {
    VStack(spacing: .s6) {
        HStack(spacing: .s4) {
            Image("full-stack-radio.afb14e4e")
                .resizable()
                .scaledToFit()
                .frame(width: 88, height: 88)
                .rounded(.large)
                .background(.universalSlate100)
            VStack(alignment: .leading, spacing: .s1) {
                Group {
                    HStack(spacing: 0) {
                        Text("Ep.")
                            .accessibilityAddTraits(.isHeader)
                            .accessibilityLabel("Episode")
                        Text(" 128")
                    }
                    .dark(.foregroundStyle(.cyan400))
                    .foregroundStyle(.cyan500)
                    .text(.small)
                    Text("Scaling CSS at Heroku with Utility Classes")
                        .dark(.foregroundStyle(.slate400))
                        .foregroundStyle(.slate500)
                        .text(.small)
                    Text("Full Stack Radio")
                        .dark(.foregroundStyle(.slate50))
                        .foregroundStyle(.slate900)
                        .text(.large)
                }
                .padding(.vertical, 3)
            }
            .frame(minWidth: 0)
            .fontWeight(.semibold)
        }
        VStack(spacing: .s2) {
            ZStack {
                ProgressView(value: 1456, total: 4550)
                    .accessibilityLabel("music progress")
                    .height(.s2)
                    .overlay(alignment: .leading) {
                        Dark {
                            Color
                                .cyan400
                        } otherwise: {
                            Color.cyan500
                        }
                        .width(.half)
                    }
                    .dark(.background(.slate700))
                    .background(.slate100)
                    .rounded(.full)
                Dark {
                    Circle()
                        .fill(.cyan400)
                } otherwise: {
                    Circle()
                        .fill(.cyan500)
                }
                .width(.s1_5)
                .height(.s1_5)
                .ring(.slate900 / 5, thickness: .t1, inset: true)
                .width(.s4)
                .height(.s4)
                .background(.white)
                .rounded(.full)
                .ring(.cyan500, thickness: .t2, rounded: .full)
                .shadow()
            }
            HStack {
                Text("24:16")
                    .dark(.foregroundStyle(.slate100))
                    .foregroundStyle(.cyan500)
                Spacer()
                Text("75:50")
                    .dark(.foregroundStyle(.slate400))
                    .foregroundStyle(.slate500)
            }
            .text(.small, leading: 6)
            .fontWeight(.medium)
            .monospacedDigit()
        }
    }
    .padding(.horizontal, .s4)
    .padding(.top, .s4)
    .padding(.bottom, .s6)
    .dark(.background(.slate800), otherwise: .background(.white))
    .dark(.border(.slate500, .bottom), otherwise: .border(.slate100, .bottom))
    .rounded(.top, .extraLarge)
    HStack {
        HStack {
            Spacer()
            Image(systemName: "bookmark.fill")
                .accessibilityLabel("Add to favorites")
            Spacer()
            Button {} label: {
                Image(systemName: "gobackward")
                    .fontWeight(.bold)
            }
            .accessibilityLabel("Previous")
            Spacer()
        }
        Spacer()
            .width(.s20)
        HStack {
            Spacer()
            Button {} label: {
                Image(systemName: "goforward")
                    .fontWeight(.bold)
            }
            .accessibilityLabel("Skip 10 seconds")
            Spacer()
            Button {} label: {
                Text("1x")
                    .padding(.vertical, 3)
            }
            .padding(.horizontal, .s2)
            .dark(.background(.slate500), otherwise: .ring(.slate500, thickness: .t2, inset: true, rounded: .large))
            .rounded(.large)
            .dark(.foregroundStyle(.slate100))
            .foregroundStyle(.slate500)
            .text(.small, leading: 6)
            .fontWeight(.semibold)
            Spacer()
        }
    }
    .height(.s20)
    .padding(.vertical, -.s2)
    .dark(.background(.slate600), otherwise: .background(.slate50))
    .dark(.foregroundStyle(.slate200))
    .foregroundStyle(.slate500)
    .rounded(.bottom, .extraLarge)
    .buttonStyle(.plain)
    .overlay {
        Button {} label: {
            Image(systemName: "pause")
                .resizable()
                .frame(width: .point(30), height: .point(32))
        }
        .width(.s20)
        .height(.s20)
        .dark(.background(.slate100), otherwise: .background(.white))
        .dark(.foregroundStyle(.slate700))
        .foregroundStyle(.slate900)
        .rounded(.full)
        .ring(.slate900 / 5, thickness: .t1, rounded: .full)
        .shadow(.medium)
        .accessibilityLabel("Pause")
        .buttonStyle(.plain)
    }
}
```

![modern-features 0c791977](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/46ef327c-cd3c-4ae8-a34f-907295b7fc7f)

**Modern features**

## Cutting-edge is our comfort zone.

![Grid](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/616fd1d1-2888-4f00-8d1e-7485be763d52)

**Grid**

<img width="635" alt="Screenshot 2024-03-30 at 7 27 36 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/81970fb3-d359-4a0a-9832-eb4ace0b6e70">

```swift
GridView(cols: 3, .gap(.s8)) {
    Group {
        Image("mountains-1")
            .resizable()
            .scaledToFill()
            .frame(height: 110)
        Image("mountains-2")
            .resizable()
            .scaledToFill()
            .frame(height: 110)
            .col(start: 2)
            .col(end: 4)
        Image("mountains-3")
            .resizable()
            .scaledToFill()
            .frame(height: 110)
        Image("mountains-4")
            .resizable()
            .scaledToFill()
            .frame(height: 110)
        Image("mountains-5")
            .resizable()
            .scaledToFill()
            .frame(height: 110)
    }
    .rounded(.large)
    .shadow(.large)
}
```

![Transforms](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/8212a33c-8c79-4b3f-a545-2e1d3cc1e085)

**Transforms**

<img width="570" alt="Screenshot 2024-03-30 at 7 31 21 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/d76c8fe6-6713-4a4c-867f-7581611472ba">

```swift
GridView(cols: 3, .gap(.s8)) {
    Image("mountains-1")
        .resizable()
        .scaledToFill()
        .frame(height: 110)
        .rounded(.large)
        .shadow(.large)
        .scaleEffect(1.1)
        .rotationEffect(.degrees(-6))
    Image("mountains-2")
        .resizable()
        .scaledToFill()
        .frame(height: 110)
        .col(start: 2)
        .col(end: 4)
        .rounded(.large)
        .shadow(.large)
        .scaleEffect(0.75)
        .offset(x: 80, y: 16)
    Image("mountains-3")
        .resizable()
        .scaledToFill()
        .frame(height: 110)
        .rounded(.large)
        .shadow(.large)
        .scaleEffect(x: 1.5, anchor: .trailing)
        .offset(y: 44)
    Image("mountains-4")
        .resizable()
        .scaledToFill()
        .frame(height: 110)
        .rounded(.large)
        .shadow(.large)
        .offset(y: 96)
    Image("mountains-5")
        .resizable()
        .scaledToFill()
        .frame(height: 110)
        .rounded(.large)
        .shadow(.large)
        .offset(x: 8, y: 60)
        .scaleEffect(0.75)
        .rotationEffect(.degrees(6))
}
```

![Filters](https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/573cf33e-c3d7-4cd9-af9f-038170e94437)

**Filters**

<img width="635" alt="Screenshot 2024-03-30 at 7 33 44 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/6e3726bb-4059-4218-90f0-c5276f686afb">

```swift
GridView(cols: 3, .gap(.s8)) {
    Image("mountains-1")
        .resizable()
        .scaledToFill()
        .frame(height: 110)
        .rounded(.large)
        .shadow(.large)
        .blur()
    Image("mountains-2")
        .resizable()
        .scaledToFill()
        .frame(height: 110)
        .col(start: 2)
        .col(end: 4)
        .rounded(.large)
        .shadow(.large)
        .colorInvert()
    Image("mountains-3")
        .sepia()
        .resizable()
        .scaledToFill()
        .frame(height: 110)
        .rounded(.large)
        .shadow(.large)
    Image("mountains-4")
        .resizable()
        .scaledToFill()
        .frame(height: 110)
        .rounded(.large)
        .shadow(.large)
        .grayscale()
    Image("mountains-5")
        .resizable()
        .scaledToFill()
        .frame(height: 110)
        .rounded(.large)
        .shadow(.large)
        .saturation(2)
}
```
