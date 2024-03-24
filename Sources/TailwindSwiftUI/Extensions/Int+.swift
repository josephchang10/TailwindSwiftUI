//
//  File.swift
//  
//
//  Created by Jiafu Zhang on 3/15/24.
//

import Foundation

public extension Int {
    static func size(_ n: Self) -> CGFloat {
        .rem(CGFloat(n) / 4)
    }
}
