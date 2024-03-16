//
//  Spacing.swift
//
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public enum Scale {
    case s0
    case s0_5
    case s1
    case s1_5
    case s2
    case s2_5
    case s3
    case s3_5
    case s4
    case s5
    case s6
    case s7
    case s8
    case s9
    case s10
    case s11
    case s12
    case s14
    case s16
    case s20
    case s24
    case s28
    case s32
    case s36
    case s40
    case s44
    case s48
    case s52
    case s56
    case s60
    case s64
    case s72
    case s80
    case s96
    case auto
    
    var value: CGFloat? {
        switch self {
        case .s0:
            return 0
        case .s0_5:
            return 0.5
        case .s1:
            return 1
        case .s1_5:
            return 1.5
        case .s2:
            return 2
        case .s2_5:
            return 2.5
        case .s3:
            return 3
        case .s3_5:
            return 3.5
        case .s4:
            return 4
        case .s5:
            return 5
        case .s6:
            return 6
        case .s7:
            return 7
        case .s8:
            return 8
        case .s9:
            return 9
        case .s10:
            return 10
        case .s11:
            return 11
        case .s12:
            return 12
        case .s14:
            return 14
        case .s16:
            return 16
        case .s20:
            return 20
        case .s24:
            return 24
        case .s28:
            return 28
        case .s32:
            return 32
        case .s36:
            return 36
        case .s40:
            return 40
        case .s44:
            return 44
        case .s48:
            return 48
        case .s52:
            return 52
        case .s56:
            return 56
        case .s60:
            return 60
        case .s64:
            return 64
        case .s72:
            return 72
        case .s80:
            return 80
        case .s96:
            return 96
        case .auto:
            return nil
        }
    }
    
    var size: CGFloat? {
        guard let value else {
            return nil
        }
        return value / 4
    }
}

public extension View {
    func padding(_ scale: Scale) -> some View {
        padding(.all, scale)
    }
    
    func padding(_ edges: Edge.Set = .all, _ scale: Scale) -> some View {
        guard let size = scale.size else {
            return AnyView(self)
        }
        return AnyView(padding(edges, .rem(size)))
    }
}

public struct Padding: ViewModifier {
    let edges: Edge.Set
    let scale: Scale
    
    public func body(content: Content) -> some View {
        guard let size = scale.size else {
            return AnyView(content)
        }
        return AnyView(content.padding(edges, .rem(size)))
    }
}

public extension ViewModifier where Self == Padding {
    static func padding(_ scale: Scale) -> Self {
        Padding(edges: .all, scale: scale)
    }
    
    static func padding(_ edges: Edge.Set = .all, _ scale: Scale) -> Self {
        Padding(edges: edges, scale: scale)
    }
}
