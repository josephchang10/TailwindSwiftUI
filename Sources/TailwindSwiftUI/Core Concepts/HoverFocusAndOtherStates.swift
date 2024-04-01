//
//  HoverFocusAndOtherStates.swift
//
//
//  Created by Jiafu Zhang on 3/25/24.
//

import SwiftUI

public struct Hover: ViewModifier {
    @State private var isHovering = false
    let modifier: AnyViewModifier
    let otherModifier: AnyViewModifier
    
    public func body(content: Content) -> some View {
        content
            .modifier(isHovering ? modifier : otherModifier)
            .onHover { hovering in
                isHovering = hovering
            }
    }
}

public struct HoverTransform<HoverContent: View, OtherContent: View>: ViewModifier {
    @State private var isHovering = false
    let transform: (AnyView) -> HoverContent
    let otherTransform: (AnyView) -> OtherContent
    
    public func body(content: Content) -> some View {
        ZStack {
            if isHovering {
                transform(AnyView(content))
            } else {
                otherTransform(AnyView(content))
            }
        }
        .onHover { hovering in
            isHovering = hovering
        }
    }
}

struct GroupKey: EnvironmentKey {
    static let defaultValue: Value = .init()
    
    struct Value: Equatable {
        var isHovering = false
    }
}

extension EnvironmentValues {
    var group: GroupKey.Value {
        get { self[GroupKey.self] }
        set { self[GroupKey.self] = newValue }
    }
}

struct GroupModifier: ViewModifier {
    @State private var value = GroupKey.Value()
    
    func body(content: Content) -> some View {
        content
            .environment(\.group, value)
            .onHover { hovering in
                value.isHovering = hovering
            }
    }
}

struct GroupHoverModifier: ViewModifier {
    @Environment(\.group) var group
    let modifier: AnyViewModifier
    let otherModifier: AnyViewModifier
    
    func body(content: Content) -> some View {
        content
            .modifier(group.isHovering ? modifier : otherModifier)
    }
}


public extension View {
    func group() -> some View {
        modifier(GroupModifier())
    }
    
    func groupHover(_ modifier: some ViewModifier) -> some View {
        self.modifier(GroupHoverModifier(modifier: AnyViewModifier(modifier), otherModifier: AnyViewModifier(EmptyModifier())))
    }
    
    func groupHover(_ modifier: some ViewModifier, otherwise otherModofier: some ViewModifier) -> some View {
        self.modifier(GroupHoverModifier(modifier: AnyViewModifier(modifier), otherModifier: AnyViewModifier(otherModofier)))
    }
    
    func hover(_ modifier: some ViewModifier) -> some View {
        self.modifier(Hover(modifier: AnyViewModifier(modifier), otherModifier: AnyViewModifier(EmptyModifier())))
    }
    
    func hover(_ modifier: some ViewModifier, default defaultModofier: some ViewModifier) -> some View {
        self.modifier(Hover(modifier: AnyViewModifier(modifier), otherModifier: AnyViewModifier(defaultModofier)))
    }
    
    @ViewBuilder func hover<Content: View, OtherContent: View>(_ hoverTransform: @escaping (AnyView) -> Content, otherwise otherTransform: @escaping (AnyView) -> OtherContent) -> some View {
        modifier(HoverTransform(transform: hoverTransform, otherTransform: otherTransform))
    }
}

public extension ViewModifier where Self == AnyViewModifier {
    static func hover(_ modifier: AnyViewModifier) -> AnyViewModifier {
        AnyViewModifier(Hover(modifier: modifier, otherModifier: AnyViewModifier(EmptyModifier())))
    }
}
