//
//  FontSize.swift
//
//
//  Created by Jiafu Zhang on 3/16/24.
//

import SwiftUI

public struct Typography: ViewModifier {
    public enum FontSize {
        case extraSmall
        case small
        case base
        case large
        
        var size: CGFloat {
            switch self {
            case .extraSmall:
                .rem(0.75)
            case .small:
                .rem(0.875)
            case .base:
                .rem(1)
            case .large:
                .rem(1.125)
            }
        }
        
        var lineHeight: CGFloat {
            switch self {
            case .extraSmall:
                .rem(1)
            case .small:
                .rem(1.25)
            case .base:
                .rem(1.5)
            case .large:
                .rem(1.75)
            }
        }
    }
    
    let fontSize: FontSize
    
    public func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize.size))
            .lineSpacing((fontSize.lineHeight - fontSize.size) / 2)
    }
}

public extension ViewModifier where Self == Typography {
    static func text(_ fontSize: Typography.FontSize) -> Self {
        Self(fontSize: fontSize)
    }
}

public extension View {
    func text(_ fontSize: Typography.FontSize) -> some View {
        modifier(.text(fontSize))
    }
}
