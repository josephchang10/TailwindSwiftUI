//
//  AnyViewModifier.swift
//
//
//  Created by Jiafu Zhang on 3/27/24.
//

import SwiftUI

public struct AnyViewModifier: ViewModifier {
    private let applyModifier: (AnyView) -> AnyView
    
    public func body(content: Content) -> some View {
        applyModifier(AnyView(content))
    }
    
    public init<Modifier: ViewModifier>(_ modifier: Modifier) {
        self.applyModifier = { anyView in
            AnyView(anyView.modifier(modifier))
        }
    }
    
    init(applyModifier: @escaping (AnyView) -> AnyView) {
        self.applyModifier = applyModifier
    }
}
