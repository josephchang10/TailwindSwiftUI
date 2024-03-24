//
//  File.swift
//  
//
//  Created by Jiafu Zhang on 3/15/24.
//

#if canImport(UIKit)
import UIKit

extension UIWindow {
    static var key: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}
#endif
