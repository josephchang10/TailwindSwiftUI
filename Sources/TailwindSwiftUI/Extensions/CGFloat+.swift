//
//  File.swift
//
//
//  Created by Jiafu Zhang on 3/15/24.
//

#if canImport(AppKit)
import AppKit
#else
import UIKit
#endif

public extension CGFloat {
    // Converts the value from rem to points based on the preferred font size for .body text style.
    static func rem(_ n: Self) -> Self {
        // Retrieve the preferred font size for .body text style
        #if canImport(AppKit)
        let bodyFontSize = NSFont.preferredFont(forTextStyle: .body).pointSize
        #else
        let bodyFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
        #endif
        // Convert the rem value to points
        return n * bodyFontSize
    }
    
    static func scale(_ scale: Scale) -> Self? {
        scale.pixels
    }
}
