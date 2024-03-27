//
//  BorderStyle.swift
//  Utilities for controlling the style of an element's borders.
//
//  Created by Jiafu Zhang on 3/27/24.
//

import SwiftUI

extension EdgeBorder {
    public enum Style: Sendable {
        case solid, dashed, dotted, double, hidden, none
        
        func makePattern() -> [CGFloat] {
            switch self {
                case .solid: []
                case .dashed: [2, 4]
                case .dotted: [0.1, 4]
                default: []
            }
        }
    }
}

#Preview {
    HStack(spacing: .s16) {
        Button{} label: {
            Text("Button A")
                .padding(.horizontal, .s4)
                .padding(.vertical, .s2)
                .border(.solid, .indigo600, width: 2, rounded: .medium)
        }
        Button{} label: {
            Text("Button A")
                .padding(.horizontal, .s4)
                .padding(.vertical, .s2)
                .border(.dashed, .indigo600, width: 2, rounded: .medium)
        }
        Button{} label: {
            Text("Button A")
                .padding(.horizontal, .s4)
                .padding(.vertical, .s2)
                .border(.dotted, .indigo600, width: 2, rounded: .medium)
        }
        Button{} label: {
            Text("Button A")
                .padding(.horizontal, .s4)
                .padding(.vertical, .s2)
                .border(.double, .indigo600, width: 4, rounded: .medium)
        }
    }
    .buttonStyle(.plain)
    .padding(.s16)
}
