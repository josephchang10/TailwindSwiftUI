//
//  TextAlign.swift
//
//
//  Created by Jiafu Zhang on 3/16/24.
//

import SwiftUI

public struct MultilineTextAlignment: ViewModifier {
    let alignment: TextAlignment
    
    public func body(content: Content) -> some View {
        content
            .multilineTextAlignment(alignment)
    }
}

public extension ViewModifier where Self == MultilineTextAlignment {
    static func multilineTextAlignment(_ alignment: TextAlignment) -> Self {
        Self(alignment: alignment)
    }
}
