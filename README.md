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

<img width="453" alt="Screenshot 2024-03-16 at 5 41 05 PM" src="https://github.com/josephchang10/TailwindSwiftUI/assets/5158525/afcf4697-1fbd-43eb-b2e5-be72c572b490">

