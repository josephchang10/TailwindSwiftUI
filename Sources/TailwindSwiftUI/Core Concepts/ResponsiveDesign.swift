//
//  ResponsiveDesign.swift
//
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public enum Breakpoint: CaseIterable, Comparable {
    case unknown
    case small
    case medium
    case large
    
    init(width: CGFloat) {
        var breakpoint = Self.unknown
        for b in Self.allCases.reversed() {
            if let minimumWidth = b.minimumWidth, width >= minimumWidth {
                breakpoint = b
                break
            }
        }
        self = breakpoint
    }
    
    var minimumWidth: CGFloat? {
        switch self {
        case .small:
            640
        case .medium:
            768
        case .large:
            1024
        case .unknown:
            nil
        }
    }
}

struct BreakpointKey: EnvironmentKey {
    static let defaultValue: Breakpoint = .unknown
}

extension EnvironmentValues {
    var breakpoint: Breakpoint {
        get { self[BreakpointKey.self] }
        set {
            self[BreakpointKey.self] = newValue
        }
    }
}

public struct Main<Content: View>: View {
    let content: Content
    
    public var body: some View {
        GeometryReader { geometry in
            content
                .environment(\.breakpoint, .init(width: geometry.size.width))
        }
    }
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct ResponsiveDesign: ViewModifier {
    let alignment: Alignment
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
                .environment(\.breakpoint, .init(width: geometry.size.width))
        }
    }
}

public struct Small: View {
    @Environment(\.breakpoint) var breakpoint
    let content: AnyView?
    let otherContent: AnyView?
    
    public var body: some View {
        if breakpoint >= .small {
            content
        } else {
            otherContent
        }
    }

    public init(@ViewBuilder _ content: () -> some View, @ViewBuilder otherwise otherContent: () -> some View) {
        self.content = AnyView(content())
        self.otherContent = AnyView(otherContent())
    }
    
    public init(@ViewBuilder _ content: () -> some View) {
        self.content = AnyView(content())
        otherContent = nil
    }
}

public struct SmallViewModifier<T: ViewModifier, U: ViewModifier>: ViewModifier {
    @Environment(\.breakpoint) var breakpoint
    let modifier: T
    let otherModifier: U?
    
    public func body(content: Content) -> some View {
        guard breakpoint >= .small else {
            return otherModifier == nil ? AnyView(content) : AnyView(content.modifier(otherModifier!))
        }
        return AnyView(content.modifier(modifier))
    }
    
    init(modifier: T, otherwise otherModifier: U?) {
        self.modifier = modifier
        self.otherModifier = otherModifier
    }
}

public struct MediumViewModifier<T: ViewModifier, U: ViewModifier>: ViewModifier{
    @Environment(\.breakpoint) var breakpoint
    let modifier: T
    let otherModifier: U?
    
    public func body(content: Content) -> some View {
        guard breakpoint >= .medium else {
            return otherModifier == nil ? AnyView(content) : AnyView(content.modifier(otherModifier!))
        }
        return AnyView(content.modifier(modifier))
    }
    
    init(modifier: T, otherwise otherModifier: U?) {
        self.modifier = modifier
        self.otherModifier = otherModifier is EmptyModifier ? nil : otherModifier
    }
}

public struct LargeViewModifier<T: ViewModifier, U: ViewModifier>: ViewModifier {
    @Environment(\.breakpoint) var breakpoint
    let modifier: T
    let otherModifier: U?
    
    public func body(content: Content) -> some View {
        guard breakpoint >= .large else {
            return otherModifier == nil ? AnyView(content) : AnyView(content.modifier(otherModifier!))
        }
        return AnyView(content.modifier(modifier))
    }
    
    init(modifier: T, otherwise otherModifier: U?) {
        self.modifier = modifier
        self.otherModifier = otherModifier
    }
}

public struct Large: View {
    @Environment(\.breakpoint) var breakpoint
    let content: AnyView?
    let otherContent: AnyView?
    
    public var body: some View {
        if breakpoint >= .large {
            content
        } else {
            otherContent
        }
    }
    
    public init(@ViewBuilder _ content: () -> some View, @ViewBuilder otherwise otherContent: () -> some View) {
        self.content = AnyView(content())
        self.otherContent = AnyView(otherContent())
    }
    
    public init(@ViewBuilder _ content: () -> some View) {
        self.content = AnyView(content())
        otherContent = nil
    }
}

public extension View {
    // # Responsive Design
    func main(alignment: Alignment = .center) -> some View {
        modifier(ResponsiveDesign(alignment: alignment))
    }
    // Using responsive utility variants to build adaptive user interfaces.
    //
    // Every view modifier in TailwindSwiftUI can be applied conditionally at different
    // breakpoints, which makes it a piece of cake to build complex responsive
    // interfaces without ever leaving your SwiftUI.
    //
    // Breakpoints are inspired by common device resolutions:
    
    func small(_ modifier: some ViewModifier) -> some View {
        self.modifier(SmallViewModifier(modifier: modifier, otherwise: EmptyModifier()))
    }
    
    func small(_ modifier: some ViewModifier, otherwise otherModifier: some ViewModifier) -> some View {
        self.modifier(SmallViewModifier(modifier: modifier, otherwise: otherModifier))
    }
    
    func small(otherwise modifier: some ViewModifier) -> some View {
        self.modifier(SmallViewModifier(modifier: EmptyModifier(), otherwise: modifier))
    }
    
    func medium(_ modifier: some ViewModifier) -> some View {
        self.modifier(MediumViewModifier(modifier: modifier, otherwise: EmptyModifier()))
    }
    
    func medium(_ modifier: some ViewModifier, otherwise otherModifier: some ViewModifier) -> some View {
        self.modifier(MediumViewModifier(modifier: modifier, otherwise: otherModifier))
    }
    
    func medium(otherwise modifier: some ViewModifier) -> some View {
        self.modifier(MediumViewModifier(modifier: EmptyModifier(), otherwise: modifier))
    }
    
    func large(_ modifier: some ViewModifier) -> some View {
        self.modifier(LargeViewModifier(modifier: modifier, otherwise: EmptyModifier()))
    }
    
    func large(_ modifier: some ViewModifier, otherwise otherModifier: some ViewModifier) -> some View {
        self.modifier(LargeViewModifier(modifier: modifier, otherwise: otherModifier))
    }
}

public extension ViewModifier where Self == LargeViewModifier<Width, Width> {
    static func large(_ width: Width) -> Self {
        .init(modifier: width, otherwise: nil)
    }
    
    static func large(_ width: Width, otherwise otherWidth: Width) -> Self {
        .init(modifier: width, otherwise: otherWidth)
    }
}

public extension ViewModifier where Self == MediumViewModifier<Height, Height> {
    static func medium(_ height: Height) -> Self {
        .init(modifier: height, otherwise: nil)
    }
    
    static func medium(_ height: Height, otherwise otherHeight: Height) -> Self {
        .init(modifier: height, otherwise: otherHeight)
    }
}

public extension ViewModifier where Self == LargeViewModifier<Height, Height> {
    static func large(_ height: Height) -> Self {
        .init(modifier: height, otherwise: nil)
    }
    
    static func large(_ height: Height, otherwise otherHeight: Height) -> Self {
        .init(modifier: height, otherwise: otherHeight)
    }
}

public extension ViewModifier where Self == SmallViewModifier<Padding, Padding> {
    static func small(_ padding: Padding) -> Self {
        .init(modifier: padding, otherwise: nil)
    }
    
    static func small(_ padding: Padding, otherwise otherPadding: Padding) -> Self {
        .init(modifier: padding, otherwise: otherPadding)
    }
}

public extension ViewModifier where Self == MediumViewModifier<Padding, Padding> {
    static func medium(_ padding: Padding) -> Self {
        .init(modifier: padding, otherwise: nil)
    }
    
    static func medium(_ padding: Padding, otherwise otherPadding: Padding) -> Self {
        .init(modifier: padding, otherwise: otherPadding)
    }
}

public extension ViewModifier where Self == MediumViewModifier<Padding, SmallViewModifier<Padding, Padding>> {
    static func medium(padding: Padding, otherPadding: SmallViewModifier<Padding, Padding>) -> Self {
        .init(modifier: padding, otherwise: otherPadding)
    }
}

public extension ViewModifier where Self == LargeViewModifier<Padding, Padding> {
    static func large(_ padding: Padding) -> Self {
        .init(modifier: padding, otherwise: nil)
    }
    
    static func large(_ padding: Padding, otherwise otherPadding: Padding) -> Self {
        .init(modifier: padding, otherwise: otherPadding)
    }
}

public extension ViewModifier where Self == MediumViewModifier<Col, Col> {
    static func medium(_ col: Col) -> Self {
        .init(modifier: col, otherwise: nil)
    }
    
    static func medium(_ col: Col, otherwise otherCol: Col) -> Self {
        .init(modifier: col, otherwise: otherCol)
    }
}

public struct Flex<Content: View>: View {
    @Environment(\.breakpoint) var breakpoint
    let thresholdBreakpoint: Breakpoint?
    let content: () -> Content
    let horizontalSpacing: Scale?
    let verticalSpacing: Scale?
    
    public var body: some View {
        if let thresholdBreakpoint, breakpoint >= thresholdBreakpoint {
            HStack(spacing: horizontalSpacing == nil ? nil : .scale(horizontalSpacing!)) {
                content()
            }
        } else {
            VStack(spacing: verticalSpacing == nil ? nil : .scale(verticalSpacing!)) {
                content()
            }
        }
    }
    
    public init(_ thresholdBreakpoint: Breakpoint? = nil, horizontalSpacing: Scale? = nil, verticalSpacing: Scale? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.thresholdBreakpoint = thresholdBreakpoint
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
    }
}
