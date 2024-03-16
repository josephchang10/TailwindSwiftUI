//
//  File.swift
//  
//
//  Created by Jiafu Zhang on 3/15/24.
//

#if canImport(UIKit)
import UIKit

extension UIScreen {
    static var current: UIScreen? {
        UIWindow.key?.screen
    }
}
#endif
