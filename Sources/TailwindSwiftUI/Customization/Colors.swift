//
//  Colors.swift
//  TailwindSwiftUI includes an expertly-crafted default color palette out-of-the-box that
//  is a great starting point if you don't have your own specific branding in mind.
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public extension Color {
    // Slate
    static let slate50 = named("slate-50")
    static let slate100 = named("slate-100")
    static let slate200 = named("slate-200")
    static let slate300 = named("slate-300")
    static let slate400 = named("slate-400")
    static let slate500 = named("slate-500")
    static let slate600 = named("slate-600")
    static let slate700 = named("slate-700")
    static let slate800 = named("slate-800")
    static let slate900 = named("slate-900")
    static let slate950 = named("slate-950")
    
    // Sky
    static let sky50 = named("sky-50")
    static let sky100 = named("sky-100")
    static let sky200 = named("sky-200")
    static let sky300 = named("sky-300")
    static let sky400 = named("sky-400")
    static let sky500 = named("sky-500")
    static let sky600 = named("sky-600")
    static let sky700 = named("sky-700")
    static let sky800 = named("sky-800")
    static let sky900 = named("sky-900")
    static let sky950 = named("sky-950")
    
    // Helper function to get the Color from assets
    private static func named(_ name: String) -> Color {
        #if canImport(AppKit)
        .init(nsColor: NSColor(named: name, bundle: .module)!)
        #else
        .init(uiColor: UIColor(named: name, in: .module, compatibleWith: nil)!)
        #endif
    }
}

public extension ShapeStyle where Self == Color {
    // Slate
    static var slate50: Color { .slate50 }
    static var slate100: Color { .slate100 }
    static var slate200: Color { .slate200 }
    static var slate300: Color { .slate300 }
    static var slate400: Color { .slate400 }
    static var slate500: Color { .slate500 }
    static var slate600: Color { .slate600 }
    static var slate700: Color { .slate700 }
    static var slate800: Color { .slate800 }
    static var slate900: Color { .slate900 }
    static var slate950: Color { .slate950 }
    
    // Sky
    static var sky50: Color { .sky50 }
    static var sky100: Color { .sky100 }
    static var sky200: Color { .sky200 }
    static var sky300: Color { .sky300 }
    static var sky400: Color { .sky400 }
    static var sky500: Color { .sky500 }
    static var sky600: Color { .sky600 }
    static var sky700: Color { .sky700 }
    static var sky800: Color { .sky800 }
    static var sky900: Color { .sky900 }
    static var sky950: Color { .sky950 }
}
