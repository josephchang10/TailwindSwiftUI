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
    var alignment: Alignment = .center
    
    public func body(content: Content) -> some View {
        content
            .height(scale, alignment: alignment)
    }
}

public extension ViewModifier where Self == Height {
    static func height(_ scale: Scale, alignment: Alignment = .center) -> Self {
        Self(scale: scale, alignment: alignment)
    }
}

public extension View {
    func height(_ scale: Scale, alignment: Alignment = .center) -> some View {
        frame(height: .scale(scale), alignment: alignment)
            .onAppear(perform: {
                print("Height: \(scale)")
            })
    }
    
    func height(_ scale: Height.HScale, alignment: Alignment = .center) -> some View {
        switch scale {
        case .full:
            frame(maxHeight: .infinity, alignment: alignment)
        }
    }
}
