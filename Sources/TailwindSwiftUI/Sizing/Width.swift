//
//  Width.swift
//
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public struct Width: ViewModifier {
    public enum WScale {
        case full
    }
    
    var scale: Scale?
    var wScale: WScale?
    var alignment: Alignment = .center
    
    public func body(content: Content) -> some View {
        if let scale {
            content
                .width(scale)
        } else if let wScale {
            content
                .width(wScale, alignment: alignment)
        } else {
            content
        }
    }
}

public extension ViewModifier where Self == Width {
    static func width(_ scale: Scale, alignment: Alignment = .center) -> Self {
        Self(scale: scale, alignment: alignment)
    }
    
    static func width(_ scale: Width.WScale, alignment: Alignment = .center) -> Self {
        Self(wScale: scale, alignment: alignment)
    }
}

public extension View {
    func width(_ scale: Scale) -> some View {
        frame(width: .scale(scale))
    }
    
    func width(_ scale: Width.WScale, alignment: Alignment = .center) -> some View {
        switch scale {
        case .full:
            frame(maxWidth: .infinity, alignment: alignment)
        }
    }
}
