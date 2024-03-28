//
//  File.swift
//  Utilities for controlling the border width between elements.
//
//  Created by Jiafu Zhang on 3/28/24.
//

import SwiftUI

public struct Divide<Content: View>: View {
    let content: Content
    var shapeStyle: AnyShapeStyle?

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public init(_ shapeStyle: some ShapeStyle, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.shapeStyle = AnyShapeStyle(shapeStyle)
    }

    public var body: some View {
        _VariadicView.Tree(DividedLayout(shapeStyle: shapeStyle)) {
            content
        }
    }

    struct DividedLayout: _VariadicView_MultiViewRoot {
        let shapeStyle: AnyShapeStyle?
        
        @ViewBuilder
        func body(children: _VariadicView.Children) -> some View {
            let last = children.last?.id

            ForEach(children) { child in
                child

                if child.id != last {
                    Divider()
                        .if(shapeStyle != nil) { content in
                            content
                                .overlay(shapeStyle!)
                        }
                }
            }
        }
    }
}

// **Basic usage**
// # Add borders between horizontal children
#Preview {
    HStack {
        Divide {
            Text("01")
            Text("02")
            Text("03")
        }
    }
    .fixedSize()
}

// # Add borders between vertical children
#Preview {
    VStack {
        Divide {
            Text("01")
            Text("02")
            Text("03")
        }
    }
    .fixedSize()
}
