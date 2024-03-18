//
//  LetterSpacing.swift
//
//
//  Created by Jiafu Zhang on 3/18/24.
//

import SwiftUI

public struct Kerning: ViewModifier {
    public enum Size {
        case tighter
        case tight
        case normal
        case wide
        case wider
        case widest
        
        var letterSpacing: CGFloat {
            switch self {
            case .tighter:
                .rem(-0.05)
            case .tight:
                .rem(-0.025)
            case .normal:
                .rem(0)
            case .wide:
                .rem(0.025)
            case .wider:
                .rem(0.05)
            case .widest:
                .rem(0.1)
            }
        }
    }
    
    let size: Size
    
    public func body(content: Content) -> some View {
        content
            .kerning(size.letterSpacing)
    }
}

public extension View {
    func kerning(_ size: Kerning.Size) -> some View {
        modifier(Kerning(size: size))
    }
}
