//
//  FontWeight.swift
//
//
//  Created by Jiafu Zhang on 3/17/24.
//

import SwiftUI

public struct FontWeight: ViewModifier {
    let weight: Font.Weight
    
    public func body(content: Content) -> some View {
        content
            .fontWeight(weight)
    }
}

public extension ViewModifier where Self == FontWeight {
    static func fontWeight(_ weight: Font.Weight) -> Self {
        Self(weight: weight)
    }
}
