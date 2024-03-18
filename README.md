# Rapidly build modern apps without ever leaving your SwiftUI.

A utility-first Swift package packed with view modifiers that can be composed to build any design, directly in your SwiftUI code.

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
