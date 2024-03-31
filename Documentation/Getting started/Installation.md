#  Getting started with Tailwind SwiftUI

## Installation

**Swift Package Manager**

**1. Add TailwindSwiftUI as a dependency**

Add it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/Mijick/Navigattie", branch(“main”))
]
```

**2. Start using TailwindSwiftUI in your SwiftUI**

Start using Tailwind SwiftUI's view modifiers to style your content.

```swift
import SwiftUI

struct InstallationView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .text(.extraLarge3)
            .fontWeight(.bold)
            .underline()
    }
}

#Preview {
    InstallationView()
}
```
