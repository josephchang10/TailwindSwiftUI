//
//  BorderRadius.swift
//
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public struct BorderRadius: ViewModifier {
    public enum Size: CGFloat {
        case none = 0
        case small = 0.125
        case notSpecific = 0.25
        case medium = 0.375
        case large = 0.5
        case extraLarge = 0.75
        case doubleExtraLarge = 1
        case tripleExtraLarge = 1.5
        case full = 9999
        
        var cornerRadius: CGFloat {
            .rem(rawValue)
        }
    }
    
    let size: Size
    
    public func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: size.cornerRadius))
    }
}

public extension View {
    func rounded(_ size: BorderRadius.Size = .notSpecific) -> some View {
        modifier(BorderRadius(size: size))
    }
}

public extension ViewModifier where Self == BorderRadius {
    static func rounded(_ size: BorderRadius.Size = .notSpecific) -> Self {
        Self(size: size)
    }
}
