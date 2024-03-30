//
//  TopRightBottomLeft.swift
//  Utilities for controlling the placement of positioned elements.
//
//  Created by Jiafu Zhang on 3/18/24.
//

import SwiftUI

public struct TopRightBottomLeft: ViewModifier {
    public enum Scale {
        case s0, s0_5, s1, s1_5, s2, s2_5, s3, s3_5, s4, s5, s6, s7, s8, s9, s10, s11, s12, s14, s16, s20, s24, s28, s32, s36, s40, s44, s48, s52, s56, s60, s64, s72, s80, s96
        
        // Negative values
        
        case n0_5, n1, n1_5, n2, n2_5, n3, n3_5, n4, n5, n6, n7, n8, n9, n10, n11, n12, n14, n16, n20, n24, n28, n32, n36, n40, n44, n48, n52, n56, n60, n64, n72, n80, n96
        
        case half
        
        var value: CGFloat? {
            switch self {
            case .s0:
                return 0
            case .s0_5:
                return 0.5
            case .n0_5:
                return -Self.s0_5.value!
            case .s1:
                return 1
            case .n1:
                return -Self.s1.value!
            case .s1_5:
                return 1.5
            case .n1_5:
                return -Self.s1_5.value!
            case .s2:
                return 2
            case .n2:
                return -Self.s2.value!
            case .s2_5:
                return 2.5
            case .n2_5:
                return -Self.s2_5.value!
            case .s3:
                return 3
            case .n3:
                return -Self.s3.value!
            case .s3_5:
                return 3.5
            case .n3_5:
                return -Self.s3_5.value!
            case .s4:
                return 4
            case .n4:
                return -Self.s4.value!
            case .s5:
                return 5
            case .n5:
                return -Self.s5.value!
            case .s6:
                return 6
            case .n6:
                return -Self.s6.value!
            case .s7:
                return 7
            case .n7:
                return -Self.s7.value!
            case .s8:
                return 8
            case .n8:
                return -Self.s8.value!
            case .s9:
                return 9
            case .n9:
                return -Self.s9.value!
            case .s10:
                return 10
            case .n10:
                return -Self.s10.value!
            case .s11:
                return 11
            case .n11:
                return -Self.s11.value!
            case .s12:
                return 12
            case .n12:
                return -Self.s12.value!
            case .s14:
                return 14
            case .n14:
                return -Self.s14.value!
            case .s16:
                return 16
            case .n16:
                return -Self.s16.value!
            case .s20:
                return 20
            case .n20:
                return -Self.s20.value!
            case .s24:
                return 24
            case .n24:
                return -Self.s24.value!
            case .s28:
                return 28
            case .n28:
                return -Self.s28.value!
            case .s32:
                return 32
            case .n32:
                return -Self.s32.value!
            case .s36:
                return 36
            case .n36:
                return -Self.s36.value!
            case .s40:
                return 40
            case .n40:
                return -Self.s40.value!
            case .s44:
                return 44
            case .n44:
                return -Self.s44.value!
            case .s48:
                return 48
            case .n48:
                return -Self.s48.value!
            case .s52:
                return 52
            case .n52:
                return -Self.s52.value!
            case .s56:
                return 56
            case .n56:
                return -Self.s56.value!
            case .s60:
                return 60
            case .n60:
                return -Self.s60.value!
            case .s64:
                return 64
            case .n64:
                return -Self.s64.value!
            case .s72:
                return 72
            case .n72:
                return -Self.s72.value!
            case .s80:
                return 80
            case .n80:
                return -Self.s80.value!
            case .s96:
                return 96
            case .n96:
                return -Self.s96.value!
            default:
                return nil
            }
        }
        
        var size: CGFloat? {
            if let value {
                value / 4
            } else {
                nil
            }
        }
    }
    
    enum Position {
        case top, right, bottom, left
    }
    
    let position: Position
    let scale: Scale
    
    public func body(content: Content) -> some View {
        switch position {
        case .top:
            GeometryReader { geometry in
                let pixels = scale == .half ? geometry.size.height / 2 : .rem(scale.size!)
                content
                    .frame(width: geometry.size.width, height: geometry.size.height - pixels)
                    .offset(y: pixels)
            }
        case .right:
            GeometryReader { geometry in
                content.frame(width: geometry.size.width - (scale == .half ? geometry.size.width / 2 : .rem(scale.size!)), height: geometry.size.height)
            }
        case .bottom:
            GeometryReader { geometry in
                content.frame(width: geometry.size.width, height: geometry.size.height - (scale == .half ? geometry.size.height / 2 : .rem(scale.size!)))
            }
        case .left:
            GeometryReader { geometry in
                let pixels = scale == .half ? geometry.size.width / 2 : .rem(scale.size!)
                content
                    .frame(width: geometry.size.width - pixels, height: geometry.size.height)
                    .offset(x: pixels)
            }
        }
    }
}

public extension View {
    func top(_ scale: TopRightBottomLeft.Scale) -> some View {
        modifier(TopRightBottomLeft(position: .top, scale: scale))
    }
    
    func right(_ scale: TopRightBottomLeft.Scale) -> some View {
        modifier(TopRightBottomLeft(position: .right, scale: scale))
    }
    
    func bottom(_ scale: TopRightBottomLeft.Scale) -> some View {
        modifier(TopRightBottomLeft(position: .bottom, scale: scale))
    }
    
    func left(_ scale: TopRightBottomLeft.Scale) -> some View {
        modifier(TopRightBottomLeft(position: .left, scale: scale))
    }
}

#Preview {
    ZStack {
        Group {
            Rectangle()
                .fill(.teal)
            Rectangle()
                .fill(.purple)
                .top(.s20)
                .right(.s20)
                .bottom(.n10)
                .left(.n10)
        }
        .aspectRatio(1, contentMode: .fit)
        .width(.s40)
    }
    .width(.s80)
    .height(.s80)
}

#Preview {
    ZStack {
        Rectangle()
            .fill(.sky500)
            .width(.s20)
            .height(.s20)
        Rectangle()
            .width(.s20)
            .height(.s20)
            .left(.half)
    }
    .width(.s80)
    .height(.s80)
}
