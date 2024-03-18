//
//  LineHeight.swift
//
//
//  Created by Jiafu Zhang on 3/18/24.
//

import SwiftUI

public extension ViewModifier where Self == Typography {
    static func text(_ fontSize: Typography.FontSize, leading lineHeight: CGFloat?) -> Self {
        Self(fontSize: fontSize, lineHeight: lineHeight)
    }
}

public extension View {
    func text(_ fontSize: Typography.FontSize, leading lineHeight: CGFloat?) -> some View {
        modifier(.text(fontSize, leading: lineHeight))
    }
    
    func text(_ fontSize: Typography.FontSize, leading lineHeight: Scale) -> some View {
        modifier(.text(fontSize, leading: lineHeight.size == nil ? nil : .rem(lineHeight.size!)))
    }
}
