//
//  BorderWidth.swift.swift
//
//
//  Created by Jiafu Zhang on 3/16/24.
//

import SwiftUI

struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: Edge.Set

    func path(in rect: CGRect) -> Path {
        switch edges {
        case .all: Path(rect)
        case .top: Path(.init(x: rect.minX, y: rect.minY, width: rect.width, height: width))
        case .bottom: Path(.init(x: rect.minX, y: rect.maxY - width, width: rect.width, height: width))
        case .horizontal: Path(.init(x: rect.minX, y: rect.midY - width / 2, width: rect.width, height: width))
        case .leading: Path(.init(x: rect.minX, y: rect.minY, width: width, height: rect.height))
        case .trailing: Path(.init(x: rect.maxX - width, y: rect.minY, width: width, height: rect.height))
        case .vertical: Path(.init(x: rect.midX - width / 2, y: rect.minY, width: width, height: rect.height))
        default: Path()
        }
    }
}

public extension View {
    func border(_ edges: Edge.Set = .all) -> some View {
        overlay(EdgeBorder(width: 1, edges: edges))
    }
    
    func border(_ content: some ShapeStyle = .black, _ edges: Edge.Set) -> some View {
        overlay(EdgeBorder(width: 1, edges: edges).fill(content))
    }
}
