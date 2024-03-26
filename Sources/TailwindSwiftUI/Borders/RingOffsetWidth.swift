//
//  RingOffsetWidth.swift
//  Utilities for simulating an offset when adding outline rings.
//
//  Created by Jiafu Zhang on 3/25/24.
//

import SwiftUI

public struct RingOffset<S: ShapeStyle> {
    public enum Width: CGFloat {
        case s0
        case s1
        case s2
        case s4 = 4
        case s8 = 8
    }
    
    let content: S
    let width: Width
    
    public init(_ content: S = .clear, width: Width = .s0) {
        self.content = content
        self.width = width
    }
}

#Preview {
    HStack(spacing: .scale(.s20)) {
        Button {} label: {
            Text("Button A")
                .padding(.horizontal, .s4)
                .padding(.vertical, .s2)
                .fontWeight(.medium)
                .rounded(.medium)
                .border(.slate300, rounded: .medium)
                .ring(.pink500, rounded: .medium)
        }
        Button {} label: {
            Text("Button B")
                .padding(.horizontal, .s4)
                .padding(.vertical, .s2)
                .fontWeight(.medium)
                .rounded(.medium)
                .border(.slate300, rounded: .medium)
                .ring(.pink500, offset: .init(width: .s2), rounded: .medium)
        }
        Button {} label: {
            Text("Button C")
                .padding(.horizontal, .s4)
                .padding(.vertical, .s2)
                .fontWeight(.medium)
                .rounded(.medium)
                .border(.slate300, rounded: .medium)
                .ring(.pink500, offset: .init(width: .s4), rounded: .medium)
        }
    }
    .buttonStyle(.plain)
    .padding(.s20)
}
