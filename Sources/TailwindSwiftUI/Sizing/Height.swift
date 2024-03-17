//
//  Height.swift
//
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public struct Height: ViewModifier {
    public enum HScale {
        case full
    }
    
    let scale: Scale
    
    public func body(content: Content) -> some View {
        content
            .height(scale)
    }
}

public extension ViewModifier where Self == Height {
    static func height(_ scale: Scale) -> Self {
        Self(scale: scale)
    }
}

public extension View {
    func height(_ scale: Scale) -> some View {
        frame(height: .scale(scale))
    }
    
    func height(_ scale: Height.HScale) -> some View {
        switch scale {
        case .full:
            frame(maxHeight: .infinity)
        }
    }
}
