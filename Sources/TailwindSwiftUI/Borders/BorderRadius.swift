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
        case extraLarge2 = 1
        case extraLarge3 = 1.5
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
    
    func border(_ content: some ShapeStyle = .black, rounded size: BorderRadius.Size) -> some View {
        clipShape(RoundedRectangle(cornerRadius: size.cornerRadius))
            .overlay(RoundedRectangle(cornerRadius: size.cornerRadius).stroke(content))
    }
}

public extension ViewModifier where Self == BorderRadius {
    static func rounded(_ size: BorderRadius.Size = .notSpecific) -> Self {
        Self(size: size)
    }
}

#Preview {
    Button {} label: {
        Text("Button A")
            .padding(.horizontal, .s4)
            .padding(.vertical, .s2)
            .fontWeight(.semibold)
            .text(.small)
            .background(.red)
            .foregroundStyle(.slate400)
            .border(.green, rounded: .extraLarge3)
            .shadow(.small)
    }
}
