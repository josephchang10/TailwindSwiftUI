//
//  DarkMode.swift
//  # Dark Mode
//  Use Tailwind SwiftUI to style your app in dark mode.
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public struct Dark<T: ViewModifier, U: ViewModifier>: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    let modifier: T
    let otherModifier: U?
    
    public func body(content: Content) -> some View {
        colorScheme == .dark ? AnyView(content.modifier(modifier)) : otherModifier == nil ? AnyView(content) : AnyView(content.modifier(otherModifier!))
    }
    
    init(modifier: T, otherModifier: U?) {
        self.modifier = modifier
        self.otherModifier = otherModifier is EmptyModifier ? nil : otherModifier
    }
}

public struct Background<S: ShapeStyle>: ViewModifier {
    let style: S
    
    public func body(content: Content) -> some View {
        content
            .background(style)
    }
    
    init(style: S) {
        self.style = style
    }
}

public extension View {
    func dark<T: ViewModifier>(_ modifier: T) -> AnyView {
        AnyView(self.modifier(Dark(modifier: modifier, otherModifier: EmptyModifier())))
    }
    
    func dark<T: ViewModifier, U: ViewModifier>(_ modifier: T, otherwise otherModifier: U) -> AnyView {
        AnyView(self.modifier(Dark(modifier: modifier, otherModifier: otherModifier)))
    }
}

public extension ViewModifier where Self == Dark<Background<Color>, Background<Color>> {
    static func background<S>(_ style: S) -> Background<S> where S : ShapeStyle {
        Background(style: style)
    }
}

#Preview {
    Text("Hello, World!")
        .dark(.foregroundStyle(.red), otherwise: .foregroundStyle(.blue))
}
