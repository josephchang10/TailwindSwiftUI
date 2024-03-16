//
//  File.swift
//
//
//  Created by Jiafu Zhang on 3/16/24.
//

import SwiftUI

public struct ForegroundStyle<T: ShapeStyle>: ViewModifier {
    let style: T
    
    public func body(content: Content) -> some View {
        content
            .foregroundStyle(style)
    }
}

public extension ViewModifier where Self == ForegroundStyle<Color> {
    static func foregroundStyle<S>(_ style: S) -> ForegroundStyle<S> where S : ShapeStyle  {
        ForegroundStyle(style: style)
    }
}
