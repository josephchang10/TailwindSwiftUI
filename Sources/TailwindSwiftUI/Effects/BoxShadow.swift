//
//  BoxShadow.swift
//
//
//  Created by Jiafu Zhang on 3/16/24.
//

import SwiftUI

public struct Shadow: ViewModifier {
    public enum Size {
        case small
        case base
    }
    
    let size: Size
    
    public func body(content: Content) -> some View {
        switch size {
        case .small:
            content
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        case .base:
            content
                .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 1)
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
        }
    }
}

public extension View {
    func shadow(_ size: Shadow.Size = .base) -> some View {
        modifier(Shadow(size: size))
    }
}
