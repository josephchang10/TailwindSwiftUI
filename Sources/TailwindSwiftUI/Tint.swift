//
//  Tint.swift
//
//
//  Created by Jiafu Zhang on 3/29/24.
//

import SwiftUI

public struct Tint: ViewModifier {
    let tint: Color?
    
    public func body(content: Content) -> some View {
        content
            .tint(tint)
    }
}

public extension ViewModifier where Self == Tint {
    static func tint(_ tint: Color?) -> Self {
        Tint(tint: tint)
    }
}
