//
//  BorderRadius.swift
//  Utilities for controlling the border radius of an element.
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public struct BorderRadius: ViewModifier {
    public enum Size: CGFloat {
        case none = 0
        case small = 0.125
        case base = 0.25
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
    let edges: Edge.Set
    
    public func body(content: Content) -> some View {
        content
            .clipShape(
                .rect(
                    topLeadingRadius: edges.contains(.top) || edges.contains(.leading) ? size.cornerRadius : 0,
                    bottomLeadingRadius: edges.contains(.bottom) || edges.contains(.leading) ? size.cornerRadius : 0,
                    bottomTrailingRadius: edges.contains(.bottom) || edges.contains(.trailing) ? size.cornerRadius : 0,
                    topTrailingRadius: edges.contains(.top) || edges.contains(.trailing) ? size.cornerRadius : 0
                )
            )
    }
}

public extension View {
    func rounded(_ size: BorderRadius.Size = .base) -> some View {
        modifier(BorderRadius(size: size, edges: .all))
    }
    
    func rounded(_ edges: Edge.Set = .all, _ size: BorderRadius.Size = .base) -> some View {
        modifier(BorderRadius(size: size, edges: edges))
    }
    
    func border(_ content: some ShapeStyle = .black, rounded size: BorderRadius.Size) -> some View {
        clipShape(RoundedRectangle(cornerRadius: size.cornerRadius))
            .overlay(RoundedRectangle(cornerRadius: size.cornerRadius).stroke(content))
    }
}

public extension ViewModifier where Self == BorderRadius {
    static func rounded(_ size: BorderRadius.Size = .base, _ edges: Edge.Set = .all) -> Self {
        Self(size: size, edges: edges)
    }
}

// **Basic usage**
// # Rounded corners
//
// Use view modifiers like `.rounded(.small)`, `.rounded()` or `.rounded(.large)` to apply different border radius sizes to an element.

#Preview {
    let element = {
        Rectangle()
            .fill(.purple)
            .frame(width: 60, height: 60)
    }()
    
    return HStack(spacing: .s20) {
        element
            .rounded()
        element
            .rounded(.medium)
        element
            .rounded(.large)
        element
            .rounded(.full)
    }
    .padding(.s20)
}

// # Pill buttons
//
// Use the `.rounded(.full)` view modifier to create pill buttons.

#Preview {
    Button{} label: {
        Text("Save Changes")
            .padding(.horizontal, .s4)
            .padding(.vertical, .s2)
            .fontWeight(.semibold)
            .text(.small)
            .background(.cyan500)
            .foregroundStyle(.white)
            .rounded(.full)
            .shadow(.small)
    }
    .buttonStyle(.plain)
    .padding()
}

// # Rounding sides separately
//
// Use the `.rounded(_, .top)`, `.rounded(_, .trailing)`, `.rounded(_, .bottom)`, and `rounded(_, .leading)` view modifiers to only round one side of an element.

#Preview {
    let element = {
        Rectangle()
            .fill(.blue)
            .frame(width: 60, height: 60)
    }()
    
    return HStack(spacing: .s20) {
        element
            .rounded(.top, .large)
        element
            .rounded(.trailing, .large)
        element
            .rounded(.bottom, .large)
        element
            .rounded(.leading, .large)
    }
    .padding(.s20)
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
