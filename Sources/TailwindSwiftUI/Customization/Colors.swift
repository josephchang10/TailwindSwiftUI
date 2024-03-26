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
    
    // Teal
    static let teal50 = named("teal-50")
    static let teal100 = named("teal-100")
    static let teal200 = named("teal-200")
    static let teal300 = named("teal-300")
    static let teal400 = named("teal-400")
    static let teal500 = named("teal-500")
    static let teal600 = named("teal-600")
    static let teal700 = named("teal-700")
    static let teal800 = named("teal-800")
    static let teal900 = named("teal-900")
    static let teal950 = named("teal-950")
    
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
    
    // Blue
    static let blue50 = named("blue-50")
    static let blue100 = named("blue-100")
    static let blue200 = named("blue-200")
    static let blue300 = named("blue-300")
    static let blue400 = named("blue-400")
    static let blue500 = named("blue-500")
    static let blue600 = named("blue-600")
    static let blue700 = named("blue-700")
    static let blue800 = named("blue-800")
    static let blue900 = named("blue-900")
    static let blue950 = named("blue-950")
    
    // Indigo
    static let indigo50 = named("indigo-50")
    static let indigo100 = named("indigo-100")
    static let indigo200 = named("indigo-200")
    static let indigo300 = named("indigo-300")
    static let indigo400 = named("indigo-400")
    static let indigo500 = named("indigo-500")
    static let indigo600 = named("indigo-600")
    static let indigo700 = named("indigo-700")
    static let indigo800 = named("indigo-800")
    static let indigo900 = named("indigo-900")
    static let indigo950 = named("indigo-950")
    
    // Violet
    static let violet50 = named("violet-50")
    static let violet100 = named("violet-100")
    static let violet200 = named("violet-200")
    static let violet300 = named("violet-300")
    static let violet400 = named("violet-400")
    static let violet500 = named("violet-500")
    static let violet600 = named("violet-600")
    static let violet700 = named("violet-700")
    static let violet800 = named("violet-800")
    static let violet900 = named("violet-900")
    static let violet950 = named("violet-950")
    
    // Pink
    static let pink50 = named("pink-50")
    static let pink100 = named("pink-100")
    static let pink200 = named("pink-200")
    static let pink300 = named("pink-300")
    static let pink400 = named("pink-400")
    static let pink500 = named("pink-500")
    static let pink600 = named("pink-600")
    static let pink700 = named("pink-700")
    static let pink800 = named("pink-800")
    static let pink900 = named("pink-900")
    static let pink950 = named("pink-950")
    
    static let ring = named("ring")
    
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
    
    // Teal
    static var teal50: Color { .teal50 }
    static var teal100: Color { .teal100 }
    static var teal200: Color { .teal200 }
    static var teal300: Color { .teal300 }
    static var teal400: Color { .teal400 }
    static var teal500: Color { .teal500 }
    static var teal600: Color { .teal600 }
    static var teal700: Color { .teal700 }
    static var teal800: Color { .teal800 }
    static var teal900: Color { .teal900 }
    static var teal950: Color { .teal950 }
    
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
    
    // Blue
    static var blue50: Color { .blue50 }
    static var blue100: Color { .blue100 }
    static var blue200: Color { .blue200 }
    static var blue300: Color { .blue300 }
    static var blue400: Color { .blue400 }
    static var blue500: Color { .blue500 }
    static var blue600: Color { .blue600 }
    static var blue700: Color { .blue700 }
    static var blue800: Color { .blue800 }
    static var blue900: Color { .blue900 }
    static var blue950: Color { .blue950 }
    
    // Indigo
    static var indigo50: Color { .indigo50 }
    static var indigo100: Color { .indigo100 }
    static var indigo200: Color { .indigo200 }
    static var indigo300: Color { .indigo300 }
    static var indigo400: Color { .indigo400 }
    static var indigo500: Color { .indigo500 }
    static var indigo600: Color { .indigo600 }
    static var indigo700: Color { .indigo700 }
    static var indigo800: Color { .indigo800 }
    static var indigo900: Color { .indigo900 }
    static var indigo950: Color { .indigo950 }
    
    // Violet
    static var violet50: Color { .violet50 }
    static var violet100: Color { .violet100 }
    static var violet200: Color { .violet200 }
    static var violet300: Color { .violet300 }
    static var violet400: Color { .violet400 }
    static var violet500: Color { .violet500 }
    static var violet600: Color { .violet600 }
    static var violet700: Color { .violet700 }
    static var violet800: Color { .violet800 }
    static var violet900: Color { .violet900 }
    static var violet950: Color { .violet950 }
    
    // Pink
    static var pink50: Color { .pink50 }
    static var pink100: Color { .pink100 }
    static var pink200: Color { .pink200 }
    static var pink300: Color { .pink300 }
    static var pink400: Color { .pink400 }
    static var pink500: Color { .pink500 }
    static var pink600: Color { .pink600 }
    static var pink700: Color { .pink700 }
    static var pink800: Color { .pink800 }
    static var pink900: Color { .pink900 }
    static var pink950: Color { .pink950 }
}
