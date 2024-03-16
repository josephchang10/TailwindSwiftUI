//
//  ResponsiveDesign.swift
//
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public enum Breakpoint: CaseIterable, Comparable {
    case medium
    
    init?(width: CGFloat) {
        var breakpoint: Breakpoint?
        for b in Self.allCases.reversed() {
            if width >= b.minimumWidth {
                breakpoint = b
            }
        }
        if let breakpoint {
            self = breakpoint
        } else {
            return nil
        }
    }
    
    var minimumWidth: CGFloat {
        switch self {
        case .medium:
            768
        }
    }
}

struct BreakpointKey: EnvironmentKey {
    static let defaultValue: Breakpoint? = nil
}

extension EnvironmentValues {
    var breakpoint: Breakpoint? {
        get { self[BreakpointKey.self] }
        set { self[BreakpointKey.self] = newValue }
    }
}

struct ResponsiveDesign: ViewModifier {
    func body(content: Content) -> some View {
        GeometryReader(content: { geometry in
            content
                .environment(\.breakpoint, .init(width: geometry.size.width))
        })
    }
}

public extension View {
    // # Responsive Design
    func responsiveDesign() -> some View {
        modifier(ResponsiveDesign())
    }
    // Using responsive utility variants to build adaptive user interfaces.
    //
    // Every view modifier in TailwindSwiftUI can be applied conditionally at different
    // breakpoints, which makes it a piece of cake to build complex responsive
    // interfaces without ever leaving your SwiftUI.
    //
    // Breakpoints are inspired by common device resolutions:
    
    // Minimum width 768px
    func medium(_ modifier: some ViewModifier) -> AnyView {
        AnyView(self.modifier(Medium(modifier: modifier, otherwise: EmptyModifier())))
    }
    
    func medium(_ modifier: some ViewModifier, otherwise otherModifier: some ViewModifier) -> AnyView {
        AnyView(self.modifier(Medium(modifier: modifier, otherwise: otherModifier)))
    }
}

struct Medium<T: ViewModifier, U: ViewModifier>: ViewModifier{
    @Environment(\.breakpoint) var breakpoint
    let minimumWidth: CGFloat = 768
    let modifier: T
    let otherModifier: U?
    
    func body(content: Content) -> some View {
        guard let breakpoint, breakpoint >= .medium else {
            return otherModifier == nil ? AnyView(content) : AnyView(content.modifier(otherModifier!))
        }
        return AnyView(content.modifier(modifier))
    }
    
    init(modifier: T, otherwise otherModifier: U?) {
        self.modifier = modifier
        self.otherModifier = otherModifier is EmptyModifier ? nil : otherModifier
    }
}

public struct Flex<Content: View>: View {
    @Environment(\.breakpoint) var breakpoint
    let thresholdBreakpoint: Breakpoint?
    let content: () -> Content
    
    public var body: some View {
        if let breakpoint, let thresholdBreakpoint, breakpoint >= thresholdBreakpoint {
            HStack {
                content()
            }
        } else {
            VStack {
                content()
            }
        }
    }
    
    public init(_ thresholdBreakpoint: Breakpoint? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.thresholdBreakpoint = thresholdBreakpoint
    }
}
