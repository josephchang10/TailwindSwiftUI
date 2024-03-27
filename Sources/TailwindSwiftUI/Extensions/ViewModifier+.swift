//
//  ViewModifier+.swift
//
//
//  Created by Jiafu Zhang on 3/16/24.
//

import SwiftUI

public struct Frame: ViewModifier {
    let minWidth: CGFloat?
    let idealWidth: CGFloat?
    let maxWidth: CGFloat?
    let minHeight: CGFloat?
    let idealHeight: CGFloat?
    let maxHeight: CGFloat?
    let alignment: Alignment
    
    public func body(content: Content) -> some View {
        content
            .frame(minWidth: minWidth, idealWidth: idealWidth, maxWidth: maxWidth, minHeight: minHeight, idealHeight: idealHeight, maxHeight: maxHeight, alignment: alignment)
    }
}

public extension ViewModifier where Self == Frame {
    static func frame(minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment = .center) -> Self {
        Self(minWidth: minWidth, idealWidth: idealWidth, maxWidth: maxWidth, minHeight: minHeight, idealHeight: idealHeight, maxHeight: maxHeight, alignment: alignment)
    }
}

public struct Hidden: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .hidden()
    }
}

public extension ViewModifier where Self == Hidden {
    static func hidden() -> Self {
        Self()
    }
}

public extension ViewModifier where Self == AnyViewModifier {
    static func multiple(_ modifiers: [any ViewModifier]) -> AnyViewModifier {
        AnyViewModifier { view in
            modifiers.reduce(view) { view, modifier in
                AnyView(view.modifier(AnyViewModifier(modifier)))
            }
        }
    }
}

#Preview {
    Text("Hello, World!")
        .modifier(.multiple([.background(.blue), .foregroundStyle(.white)]))
}
