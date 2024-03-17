//
//  BoxShadow.swift
//
//
//  Created by Jiafu Zhang on 3/16/24.
//

import SwiftUI

public extension BoxShadow {
    enum _Type {
        case sameView(opacity: CGFloat)
        case color(c: Color)
    }
}

public struct BoxShadow: ViewModifier {
    private var type: _Type
    private var radius: CGFloat
    private var offset: CGPoint
    private var spread: CGSize

    public init(
            type: _Type,
            radius: CGFloat,
            offset: CGPoint,
            spread: CGSize
    ) {
        self.type = type
        self.radius = radius
        self.offset = offset
        self.spread = spread
    }
    
    public func body(content: Content) -> some View {
        content
            .background(
                    Group {
                        switch type {
                        case let .color(c): c
                        case let .sameView(opacity):
                            content.opacity(opacity)
                        }
                    }
                    .padding(.horizontal, -spread.width / 2)
                    .padding(.vertical, -spread.height / 2)
                    .offset(x: offset.x, y: offset.y)
                    .blur(radius: radius)
            )
    }
}

public struct Shadow: ViewModifier {
    public enum Size {
        case small
        case base
        case medium
        case large
        case extraLarge
        case extraLarge2
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
        case .medium:
            content
                .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        case .large:
            content
                .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 10)
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
        case .extraLarge:
            content
                .shadow(color: Color.black.opacity(0.1), radius: 25, x: 0, y: 20)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 8)
        case .extraLarge2:
            content
                .shadow(color: Color.black.opacity(0.25), radius: 50, x: 0, y: 25)
        }
    }
}

public extension View {
    func shadow(_ size: Shadow.Size = .base) -> some View {
        modifier(Shadow(size: size))
    }
    
    func boxShadow(_ size: Shadow.Size = .base) -> some View {
        switch size {
        case .small:
            AnyView(shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1))
        case .base:
            AnyView(shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 1)
                .boxShadow(type: .color(c: .black.opacity(0.1)), radius: 2, offset: .init(x: 0, y: 1), spread: .init(width: -1, height: -1)))
        case .medium:
            AnyView(boxShadow(type: .color(c: .black.opacity(0.1)), radius: 6, offset: .init(x: 0, y: 4), spread: .init(width: -1, height: -1))
                .boxShadow(type: .color(c: .black.opacity(0.1)), radius: 4, offset: .init(x: 0, y: 2), spread: .init(width: -2, height: -2)))
        case .large:
            AnyView(boxShadow(type: .color(c: .black.opacity(0.1)), radius: 15, offset: .init(x: 0, y: 10), spread: .init(width: -3, height: -3))
                .boxShadow(type: .color(c: .black.opacity(0.1)), radius: 6, offset: .init(x: 0, y: 4), spread: .init(width: -4, height: -4)))
        case .extraLarge:
            AnyView(boxShadow(type: .color(c: .black.opacity(0.1)), radius: 25, offset: .init(x: 0, y: 20), spread: .init(width: -5, height: -5))
                .boxShadow(type: .color(c: .black.opacity(0.1)), radius: 10, offset: .init(x: 0, y: 8), spread: .init(width: -6, height: -6)))
        case .extraLarge2:
            AnyView(boxShadow(type: .color(c: .black.opacity(0.25)), radius: 50, offset: .init(x: 0, y: 25), spread: .init(width: -12, height: -12)))
        }
    }
    
    func boxShadow(
                type: BoxShadow._Type,
                radius: CGFloat,
                offset: CGPoint = .zero,
                spread: CGSize = .zero
        ) -> some View {
            modifier(BoxShadow(
                    type: type,
                    radius: radius,
                    offset: offset,
                    spread: spread
            ))
        }
}
