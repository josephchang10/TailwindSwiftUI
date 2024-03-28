//
//  Overlay.swift
//
//
//  Created by Jiafu Zhang on 3/28/24.
//

import SwiftUI

public struct Overlay: ViewModifier {
    let shapeStyle: AnyShapeStyle
    
    public func body(content: Content) -> some View {
        content
            .overlay(shapeStyle)
    }
}

public extension ViewModifier where Self == Overlay {
    static func overlay<S: ShapeStyle>(_ shapeStyle: S) -> Self {
        Self(shapeStyle: AnyShapeStyle(shapeStyle))
    }
}
