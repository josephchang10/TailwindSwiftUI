//
//  Ring.swift
//  Utilities for creating outline rings with borders.
//
//  Created by Jiafu Zhang on 3/25/24.
//

import SwiftUI

public enum RingThickness: CGFloat {
    case t0
    case t1
    case t2
    case t3
    case t4
    case t8 = 8
}

public struct Ring<S: ShapeStyle, O: ShapeStyle>: ViewModifier {
    let content: S
    let thickness: RingThickness
    let offset: RingOffset<O>
    let roundedSize: BorderRadius.Size
    let isInset: Bool
    
    public func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: roundedSize.cornerRadius)
                    .stroke(offset.content, lineWidth: offset.width.rawValue)
            }
            .overlay {
                RoundedRectangle(cornerRadius: roundedSize.cornerRadius)
                    .stroke(self.content, lineWidth: thickness.rawValue)
                    .padding(isInset ? -thickness.rawValue / 2 : -(offset.width.rawValue + thickness.rawValue / 2))
            }
    }
}

#Preview {
    Dark {
        Circle()
            .fill(.cyan400)
    } otherwise: {
        Circle()
            .fill(.cyan500)
    }
    .width(.s1_5)
    .height(.s1_5)
    .ring(.slate900 / 5, thickness: .t1, inset: true)
    .width(.s4)
    .height(.s4)
    .background(.white)
    .rounded(.full)
    .ring(.cyan500, thickness: .t2, rounded: .full)
    .padding()
}

public extension View {
    // **Basic Usage**
    // # Adding a ring
    //
    // Use the `.ring(*)` view modifiers to apply
    // solid border of a specific thickness to an
    // element. Rings are a semi-transparent blue
    // color by default, similar to the default
    // focus ring style in many systems.
    func ring<S: ShapeStyle, O: ShapeStyle>(_ content: S = Color.ring, thickness: RingThickness = .t3, inset: Bool = false, offset: RingOffset<O> = .init(), rounded size: BorderRadius.Size = .none) -> some View {
        modifier(Ring(content: content, thickness: thickness, offset: offset, roundedSize: size, isInset: inset))
    }
    
    func ring(isFocused: Bool, focus content: some ShapeStyle = Color.ring, thickness: RingThickness = .t3, inset: Bool = false, otherwise otherContent: some ShapeStyle = .clear, thickness otherThickness: RingThickness = .t0, rounded size: BorderRadius.Size = .none) -> some View {
        modifier(Ring(content: isFocused ? AnyShapeStyle(content) : AnyShapeStyle(otherContent), thickness: isFocused ? thickness : otherThickness, offset: .init(), roundedSize: size, isInset: inset))
    }
}

public extension ViewModifier where Self == Ring<Color, Color> {
    static func ring(_ content: Color = .ring, thickness: RingThickness = .t3, inset: Bool = false, offset: RingOffset<Color> = .init(), rounded size: BorderRadius.Size = .none) -> Self {
        Self(content: content, thickness: thickness, offset: offset, roundedSize: size, isInset: inset)
    }
}

#Preview {
    HStack(spacing: .scale(.s20)) {
        Button {} label: {
            Text("Button A")
                .padding(.horizontal, .s4)
                .padding(.vertical, .s2)
                .fontWeight(.semibold)
                .text(.small)
                .background(.white)
                .foregroundStyle(.slate400)
                .border(.slate300, rounded: .medium)
                .shadow(.small)
                .ring(thickness: .t2, offset: .init(width: .s2), rounded: .medium)
        }
        Button {} label: {
            Text("Button B")
                .padding(.horizontal, .s4)
                .padding(.vertical, .s2)
                .fontWeight(.semibold)
                .text(.small)
                .background(.white)
                .foregroundStyle(.slate400)
                .border(.slate300, rounded: .medium)
                .shadow(.small)
                .ring(offset: .init(width: .s2), rounded: .medium)
        }
        Button {} label: {
            Text("Button C")
                .padding(.horizontal, .s4)
                .padding(.vertical, .s2)
                .fontWeight(.semibold)
                .text(.small)
                .background(.white)
                .foregroundStyle(.slate400)
                .border(.slate300, rounded: .medium)
                .shadow(.small)
                .ring(thickness: .t4, offset: .init(width: .s2), rounded: .medium)
        }
    }
    .buttonStyle(.plain)
    .padding(.s20)
}

// # Inset rings
//
// Use the `.ring(inset: true)` view modifier to force a ring to render on the inside of an element instead of the outside. This can be useful for elements at the edge of the screen where part of the ring won't be visible.

#Preview {
    Button{} label: {
        Text("Save Changes")
            .padding(.horizontal, .s4)
            .padding(.vertical, .s2)
            .fontWeight(.semibold)
            .text(.small)
            .background(.white)
            .foregroundStyle(.slate700)
            .rounded(.medium)
    }
    .buttonStyle(.plain)
    .ring(.pink300, thickness: .t2, inset: true, rounded: .medium)
    .padding()
    .shadow(.small)
}
