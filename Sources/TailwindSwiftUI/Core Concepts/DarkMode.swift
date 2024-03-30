//
//  DarkMode.swift
//  # Dark Mode
//  Use Tailwind SwiftUI to style your app in dark mode.
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public struct Dark<Content: View, OtherContent: View>: View {
    @Environment(\.colorScheme) var colorScheme
    
    let content: Content
    let otherContent: OtherContent
    
    public var body: some View {
        if colorScheme == .dark {
            AnyView(content)
        } else {
            AnyView(otherContent)
        }
    }
    
    public init(@ViewBuilder content: () -> Content, @ViewBuilder otherwise otherContent: () -> OtherContent) {
        self.content = content()
        self.otherContent = otherContent()
    }
}

public struct DarkViewModifier<T: ViewModifier, U: ViewModifier>: ViewModifier {
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
    
    public init(style: S) {
        self.style = style
    }
}

public extension View {
    func dark<T: ViewModifier>(_ modifier: T) -> AnyView {
        AnyView(self.modifier(DarkViewModifier(modifier: modifier, otherModifier: EmptyModifier())))
    }
    
    func dark<T: ViewModifier, U: ViewModifier>(_ modifier: T, otherwise otherModifier: U) -> AnyView {
        AnyView(self.modifier(DarkViewModifier(modifier: modifier, otherModifier: otherModifier)))
    }
}

public extension ViewModifier where Self == AnyViewModifier {
    static func background<S>(_ style: S) -> AnyViewModifier where S : ShapeStyle {
        AnyViewModifier { view in
            AnyView(view.background(style))
        }
    }
}

#Preview {
    Text("Hello, World!")
        .dark(.foregroundStyle(.red), otherwise: .foregroundStyle(.blue))
}
