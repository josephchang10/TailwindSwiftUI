//
//  Width.swift
//  
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public struct Width: ViewModifier {
    let scale: Scale
    
    public func body(content: Content) -> some View {
        content
            .width(scale)
    }
}

public extension ViewModifier where Self == Width {
    static func width(_ scale: Scale) -> Self {
        Self(scale: scale)
    }
}

public extension View {
    func width(_ scale: Scale) -> some View {
        frame(width: .scale(scale))
    }
}
