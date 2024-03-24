//
//  Color+.swift
//
//
//  Created by Jiafu Zhang on 3/19/24.
//

import SwiftUI

public extension Color {
    static func / (left: Color, right: Int) -> Color {
        left.opacity(Double(right) / 100)
    }
}
