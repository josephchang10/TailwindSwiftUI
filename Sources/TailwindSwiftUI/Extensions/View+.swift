//
//  File.swift
//
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder func `if`<TrueContent: View, FalseContent: View>(_ condition: Bool, then ifTransform: (Self) -> TrueContent, or elseTransform: (Self) -> FalseContent) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }
  
    func `if`(_ condition: Bool, _ modifier: some ViewModifier) -> some View {
        condition ? AnyView(self.modifier(modifier)) : AnyView(self)
    }
    
    func justifyEnd() -> some View {
        frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func cursorPointer() -> some View {
        modifier(CursorPointer())
    }
}

struct CursorPointer: ViewModifier {
    @State private var isHovering = false
    
    func body(content: Content) -> some View {
        content
            .onHover { hovering in
                isHovering = hovering
            }
            .onChange(of: isHovering) { oldValue, newValue in
                DispatchQueue.main.async {
                    if newValue {
                        NSCursor.pointingHand.push()
                    } else {
                        NSCursor.pop()
                    }
                }
            }
    }
}
