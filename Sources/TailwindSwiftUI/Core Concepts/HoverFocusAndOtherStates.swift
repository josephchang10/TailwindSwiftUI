//
//  HoverFocusAndOtherStates.swift
//
//
//  Created by Jiafu Zhang on 3/25/24.
//

import SwiftUI

public struct Hover<T: ViewModifier, U: ViewModifier>: ViewModifier {
    @State private var isHovering = false
    let modifier: T
    let otherModifier: U
    
    public func body(content: Content) -> some View {
        ZStack {
            if isHovering {
                content
                    .modifier(modifier)
            } else {
                content
                    .modifier(otherModifier)
            }
        }
        .onHover { hovering in
            isHovering = hovering
        }
    }
}

public extension View {
    func hover(_ modifier: some ViewModifier) -> some View {
        self.modifier(Hover(modifier: modifier, otherModifier: EmptyModifier()))
    }
    
    func hover(_ modifier: some ViewModifier, otherwise otherModofier: some ViewModifier) -> some View {
        self.modifier(Hover(modifier: modifier, otherModifier: otherModofier))
    }
}
