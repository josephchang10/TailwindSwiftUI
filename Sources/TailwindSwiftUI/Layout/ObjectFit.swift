//
//  ObjectFit.swift
//
//
//  Created by Jiafu Zhang on 3/17/24.
//

import SwiftUI

public struct Object<Content: View>: View {
    public enum Fit {
        case cover
    }
    
    let content: Content
    let fit: Fit
    
    public var body: some View {
        switch fit {
        case .cover:
            Color.clear
                .overlay {
                    content
                        .scaledToFill()
                }
        }
    }
    
    public init(_ fit: Fit, @ViewBuilder content: () -> Content) {
        self.fit = fit
        self.content = content()
    }
}
