//
//  Max.swift
//
//
//  Created by Jiafu Zhang on 3/23/24.
//

import SwiftUI

public struct Max: ViewModifier {
    public enum Scale {
        case extraLarge4
        
        var size: CGFloat {
            switch self {
            case .extraLarge4:
                return 56
            }
        }
        
        var pixels: CGFloat {
            .rem(size)
        }
    }
    
    let maxWidth: CGFloat?
    
    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: maxWidth)
    }
}

public extension View {
    func max(width: Scale) -> some View {
        modifier(Max(maxWidth: .scale(width)))
    }
    
    func max(width: Max.Scale) -> some View {
        modifier(Max(maxWidth: width.pixels))
    }
}
