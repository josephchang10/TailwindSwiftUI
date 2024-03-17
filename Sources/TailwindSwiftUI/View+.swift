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
    
    @ViewBuilder func `if`<TrueContent: View, FalseContent: View>(_ condition: Bool, if ifTransform: (Self) -> TrueContent, or elseTransform: (Self) -> FalseContent) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }
  
    func `if`(_ condition: Bool, _ modifier: some ViewModifier) -> some View {
        condition ? AnyView(self.modifier(modifier)) : AnyView(self)
    }
}
