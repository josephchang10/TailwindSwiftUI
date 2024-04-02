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
    let otherModifier: AnyViewModifier?
    
    public func body(content: Content) -> some View {
        ZStack {
            if let otherModifier {
                content
                    .modifier(isHovering ? modifier : otherModifier)
            } else if isHovering {
                content
                    .modifier(modifier)
            } else {
                content
            }
        }
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
        self.modifier(Hover(modifier: AnyViewModifier(modifier), otherModifier: nil))
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

#Preview {
    Button {} label: {
        Text("Hover")
    }
    .buttonStyle(.plain)
    .hover(.background(.red))
}

public struct ActiveStateButtonStyle: ButtonStyle {
    let modifier: AnyViewModifier
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(configuration.isPressed ? modifier : AnyViewModifier(EmptyModifier()))
    }
}

public extension ButtonStyle where Self == ActiveStateButtonStyle {
    static func active(_ modifier: AnyViewModifier) -> ActiveStateButtonStyle {
        ActiveStateButtonStyle(modifier: modifier)
    }
}

public struct DisabledStateButtonStyle: ButtonStyle {
    let modifier: AnyViewModifier
    
    public func makeBody(configuration: Configuration) -> some View {
        DisabledButton(configuration: configuration, modifier: modifier)
    }
    
    struct DisabledButton: View {
        @Environment(\.isEnabled) private var isEnabled: Bool
        let configuration: Configuration
        let modifier: AnyViewModifier
        
        var body: some View {
            configuration.label.modifier(isEnabled ? AnyViewModifier(EmptyModifier()) : modifier)
        }
    }
}

public extension ButtonStyle where Self == DisabledStateButtonStyle {
    static func disabled(_ modifier: AnyViewModifier) -> DisabledStateButtonStyle {
        DisabledStateButtonStyle(modifier: modifier)
    }
}

public struct InputTextFieldStyle: TextFieldStyle {
    let baseModifier: AnyViewModifier?
    let defaultModifier: AnyViewModifier?
    let disabledModifier: AnyViewModifier?
    let focusedModifier: AnyViewModifier?
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        InputTextField(configuration: configuration, baseModifier: baseModifier, defaultModifier: defaultModifier, disabledModifier: disabledModifier, focusedModifier: focusedModifier)
    }
    
    struct InputTextField<Label: View>: View {
        @Environment(\.isEnabled) private var isEnabled: Bool
        @FocusState private var isFocused: Bool
        let configuration: TextField<Label>
        let baseModifier: AnyViewModifier?
        let defaultModifier: AnyViewModifier?
        let disabledModifier: AnyViewModifier?
        let focusedModifier: AnyViewModifier?
        
        var body: some View {
            baseTextField
                .modifier(isEnabled ? (isFocused ? focusedModifier ?? AnyViewModifier(EmptyModifier()) : defaultModifier ?? AnyViewModifier(EmptyModifier())) : disabledModifier ?? AnyViewModifier(EmptyModifier()))
        }
        
        var textField: some View {
            configuration
                .focused($isFocused)
                .textFieldStyle(.plain)
        }
        
        var baseTextField: some View {
            textField.modifier(baseModifier ?? AnyViewModifier(EmptyModifier()))
        }
    }
}

public extension TextFieldStyle where Self == InputTextFieldStyle {
    static func input(_ baseModifier: AnyViewModifier? = nil, default defaultModifier: AnyViewModifier? = nil, disabled disabledModifier: AnyViewModifier? = nil, focused focusedModifier: AnyViewModifier? = nil) -> InputTextFieldStyle {
        .init(baseModifier: baseModifier, defaultModifier: defaultModifier, disabledModifier: disabledModifier, focusedModifier: focusedModifier)
    }
    
    static func input(_ baseModifiers: [AnyViewModifier] = [], default defaultModifiers: [AnyViewModifier] = [], disabled disabledModifiers: [AnyViewModifier] = [], focused focusedModifiers: [AnyViewModifier] = []) -> InputTextFieldStyle {
        .init(baseModifier: .multiple(baseModifiers), defaultModifier: .multiple(defaultModifiers), disabledModifier: .multiple(disabledModifiers), focusedModifier: .multiple(focusedModifiers))
    }
}

public struct UnorderedList<Data, RowContent, Divide>: View where Data: RandomAccessCollection, RowContent: View, Data.Element: Identifiable, Divide: ShapeStyle {
    private let data: Data
    private let rowContent: (Data.Element) -> RowContent
    private let first: AnyViewModifier?
    private let last: AnyViewModifier?
    private let `default`: AnyViewModifier?
    private let divide: Divide
    
    public init(_ data: Data, divide: Divide = .clear, first: AnyViewModifier? = nil, last: AnyViewModifier? = nil, default: AnyViewModifier? = nil, @ViewBuilder rowContent: @escaping (Data.Element) -> RowContent) {
        self.data = data
        self.divide = divide
        self.rowContent = rowContent
        self.first = first
        self.last = last
        self.default = `default`
    }
    
    public var body: some View {
        LazyVStack {
            ForEach(Array(data.enumerated()), id: \.element.id) { index, item in
                Group {
                    if index == 0 {
                        if let first {
                            rowContent(item)
                                .modifier(first)
                        } else {
                            rowContent(item)
                        }
                    } else if index == data.count - 1 {
                        if let last {
                            rowContent(item)
                                .modifier(last)
                        } else {
                            rowContent(item)
                        }
                    } else if let `default` {
                        rowContent(item)
                            .modifier(`default`)
                    } else {
                        rowContent(item)
                    }
                }
                .if(index != data.count - 1, .border(divide, .bottom, width: .point(1)))
            }
        }
    }
}
