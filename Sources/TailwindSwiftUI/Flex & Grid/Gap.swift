//
//  Gap.swift
//  Utilities for controlling gutters between grid items.
//
//  Created by Jiafu Zhang on 3/25/24.
//

import SwiftUI

public extension GridLayout {
    struct Gap {
        let column: Scale
        let row: Scale
        
        public static func gap(_ scale: Scale) -> Self {
            .init(column: scale, row: scale)
        }
        
        public static func gap(horizontal column: Scale? = nil,  vertical row: Scale? = nil) -> Self {
            .init(column: column ?? .s0, row: row ?? .s0)
        }
    }
}
