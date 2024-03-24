//
//  BackgroundImage.swift
//
//
//  Created by Jiafu Zhang on 3/19/24.
//

import SwiftUI

public struct Gradient: View {
    public enum Direction {
        case right
        
        var startPoint: UnitPoint {
            switch self {
            case .right:
                .leading
            }
        }
        
        var endPoint: UnitPoint {
            switch self {
            case .right:
                .trailing
            }
        }
    }
    
    let direction: Direction
    let colors: [Color]
    
    public var body: some View {
        LinearGradient(colors: colors, startPoint: direction.startPoint, endPoint: direction.endPoint)
    }
}

public struct BackgroundGradient: ViewModifier {
    let direction: Gradient.Direction
    let colors: [Color]
    
    public func body(content: Content) -> some View {
        content
            .background(Gradient(direction: direction, colors: colors))
    }
}

public extension View {
    func backgroundGradient(to direction: Gradient.Direction, from fromColor: Color, via viaColor: Color) -> some View {
        modifier(BackgroundGradient(direction: direction, colors: [fromColor, viaColor]))
    }
}

public extension ViewModifier where Self == BackgroundGradient {
    static func backgroundGradient(to direction: Gradient.Direction, from fromColor: Color, via viaColor: Color) -> Self {
        BackgroundGradient(direction: direction, colors: [fromColor, viaColor])
    }
}
