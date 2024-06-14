//
//  Colors.swift
//  TailwindSwiftUI includes an expertly-crafted default color palette out-of-the-box that
//  is a great starting point if you don't have your own specific branding in mind.
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public extension Color {
    enum Palette: String {
        // Slate
        case slate50
        case slate100
        case slate200
        case slate300
        case slate400
        case slate500
        case slate600
        case slate700
        case slate800
        case slate900
        case slate950
        
        // Teal
        case teal50
        case teal100
        case teal200
        case teal300
        case teal400
        case teal500
        case teal600
        case teal700
        case teal800
        case teal900
        case teal950
        
        // Cyan
        case cyan50
        case cyan100
        case cyan200
        case cyan300
        case cyan400
        case cyan500
        case cyan600
        case cyan700
        case cyan800
        case cyan900
        case cyan950
        
        // Sky
        case sky50
        case sky100
        case sky200
        case sky300
        case sky400
        case sky500
        case sky600
        case sky700
        case sky800
        case sky900
        case sky950
        
        // Blue
        case blue50
        case blue100
        case blue200
        case blue300
        case blue400
        case blue500
        case blue600
        case blue700
        case blue800
        case blue900
        case blue950
        
        // Indigo
        case indigo50
        case indigo100
        case indigo200
        case indigo300
        case indigo400
        case indigo500
        case indigo600
        case indigo700
        case indigo800
        case indigo900
        case indigo950
        
        // Violet
        case violet50
        case violet100
        case violet200
        case violet300
        case violet400
        case violet500
        case violet600
        case violet700
        case violet800
        case violet900
        case violet950
        
        // Purple
        case purple50
        case purple100
        case purple200
        case purple300
        case purple400
        case purple500
        case purple600
        case purple700
        case purple800
        case purple900
        case purple950
        
        // Fuchsia
        case fuchsia50
        case fuchsia100
        case fuchsia200
        case fuchsia300
        case fuchsia400
        case fuchsia500
        case fuchsia600
        case fuchsia700
        case fuchsia800
        case fuchsia900
        case fuchsia950
        
        // Pink
        case pink50
        case pink100
        case pink200
        case pink300
        case pink400
        case pink500
        case pink600
        case pink700
        case pink800
        case pink900
        case pink950
        
        static let regex = try! NSRegularExpression(pattern: "([a-z])([A-Z0-9])")
        
        var name: String {
            let range = NSRange(location: 0, length: rawValue.count)
            return Self.regex.stringByReplacingMatches(in: rawValue, options: [], range: range, withTemplate: "$1-$2").lowercased()
        }
        
        var color: Color {
            Color.named(name)
        }
        
        var universalColor: Color {
            Color.named(name + "-universal")
        }
    }
    // Slate
    static let slate50 = Palette.slate50.color
    static let universalSlate50 = Palette.slate50.universalColor
    static let slate100 = Palette.slate100.color
    static let universalSlate100 = Palette.slate100.universalColor
    static let slate200 = Palette.slate200.color
    static let universalSlate200 = Palette.slate200.universalColor
    static let slate300 = Palette.slate300.color
    static let universalSlate300 = Palette.slate300.universalColor
    static let slate400 = Palette.slate400.color
    static let universalSlate400 = Palette.slate400.universalColor
    static let slate500 = Palette.slate500.color
    static let universalSlate500 = Palette.slate500.universalColor
    static let slate600 = Palette.slate600.color
    static let universalSlate600 = Palette.slate600.universalColor
    static let slate700 = Palette.slate700.color
    static let universalSlate700 = Palette.slate700.universalColor
    static let slate800 = Palette.slate800.color
    static let universalSlate800 = Palette.slate800.universalColor
    static let slate900 = Palette.slate900.color
    static let universalSlate900 = Palette.slate900.universalColor
    static let slate950 = Palette.slate950.color
    static let universalSlate950 = Palette.slate950.universalColor
    
    // Teal
    static let teal50 = Palette.teal50.color
    static let universalTeal50 = Palette.teal50.universalColor
    static let teal100 = Palette.teal100.color
    static let universalTeal100 = Palette.teal100.universalColor
    static let teal200 = Palette.teal200.color
    static let universalTeal200 = Palette.teal200.universalColor
    static let teal300 = Palette.teal300.color
    static let universalTeal300 = Palette.teal300.universalColor
    static let teal400 = Palette.teal400.color
    static let universalTeal400 = Palette.teal400.universalColor
    static let teal500 = Palette.teal500.color
    static let universalTeal500 = Palette.teal500.universalColor
    static let teal600 = Palette.teal600.color
    static let universalTeal600 = Palette.teal600.universalColor
    static let teal700 = Palette.teal700.color
    static let universalTeal700 = Palette.teal700.universalColor
    static let teal800 = Palette.teal800.color
    static let universalTeal800 = Palette.teal800.universalColor
    static let teal900 = Palette.teal900.color
    static let universalTeal900 = Palette.teal900.universalColor
    static let teal950 = Palette.teal950.color
    static let universalTeal950 = Palette.teal950.universalColor
    
    // Sky
    static let sky50 = Palette.sky50.color
    static let universalSky50 = Palette.sky50.universalColor
    static let sky100 = Palette.sky100.color
    static let universalSky100 = Palette.sky100.universalColor
    static let sky200 = Palette.sky200.color
    static let universalSky200 = Palette.sky200.universalColor
    static let sky300 = Palette.sky300.color
    static let universalSky300 = Palette.sky300.universalColor
    static let sky400 = Palette.sky400.color
    static let universalSky400 = Palette.sky400.universalColor
    static let sky500 = Palette.sky500.color
    static let universalSky500 = Palette.sky500.universalColor
    static let sky600 = Palette.sky600.color
    static let universalSky600 = Palette.sky600.universalColor
    static let sky700 = Palette.sky700.color
    static let universalSky700 = Palette.sky700.universalColor
    static let sky800 = Palette.sky800.color
    static let universalSky800 = Palette.sky800.universalColor
    static let sky900 = Palette.sky900.color
    static let universalSky900 = Palette.sky900.universalColor
    static let sky950 = Palette.sky950.color
    static let universalSky950 = Palette.sky950.universalColor
    
    // Cyan
    static let cyan50 = Palette.cyan50.color
    static let universalCyan50 = Palette.cyan50.universalColor
    static let cyan100 = Palette.cyan100.color
    static let universalCyan100 = Palette.cyan100.universalColor
    static let cyan200 = Palette.cyan200.color
    static let universalCyan200 = Palette.cyan200.universalColor
    static let cyan300 = Palette.cyan300.color
    static let universalCyan300 = Palette.cyan300.universalColor
    static let cyan400 = Palette.cyan400.color
    static let universalCyan400 = Palette.cyan400.universalColor
    static let cyan500 = Palette.cyan500.color
    static let universalCyan500 = Palette.cyan500.universalColor
    static let cyan600 = Palette.cyan600.color
    static let universalCyan600 = Palette.cyan600.universalColor
    static let cyan700 = Palette.cyan700.color
    static let universalCyan700 = Palette.cyan700.universalColor
    static let cyan800 = Palette.cyan800.color
    static let universalCyan800 = Palette.cyan800.universalColor
    static let cyan900 = Palette.cyan900.color
    static let universalCyan900 = Palette.cyan900.universalColor
    static let cyan950 = Palette.cyan950.color
    static let universalCyan950 = Palette.cyan950.universalColor
    
    // Blue
    static let blue50 = Palette.blue50.color
    static let universalBlue50 = Palette.blue50.universalColor
    static let blue100 = Palette.blue100.color
    static let universalBlue100 = Palette.blue100.universalColor
    static let blue200 = Palette.blue200.color
    static let universalBlue200 = Palette.blue200.universalColor
    static let blue300 = Palette.blue300.color
    static let universalBlue300 = Palette.blue300.universalColor
    static let blue400 = Palette.blue400.color
    static let universalBlue400 = Palette.blue400.universalColor
    static let blue500 = Palette.blue500.color
    static let universalBlue500 = Palette.blue500.universalColor
    static let blue600 = Palette.blue600.color
    static let universalBlue600 = Palette.blue600.universalColor
    static let blue700 = Palette.blue700.color
    static let universalBlue700 = Palette.blue700.universalColor
    static let blue800 = Palette.blue800.color
    static let universalBlue800 = Palette.blue800.universalColor
    static let blue900 = Palette.blue900.color
    static let universalBlue900 = Palette.blue900.universalColor
    static let blue950 = Palette.blue950.color
    static let universalBlue950 = Palette.blue950.universalColor
    
    // Indigo
    static let indigo50 = Palette.indigo50.color
    static let universalIndigo50 = Palette.indigo50.universalColor
    static let indigo100 = Palette.indigo100.color
    static let universalIndigo100 = Palette.indigo100.universalColor
    static let indigo200 = Palette.indigo200.color
    static let universalIndigo200 = Palette.indigo200.universalColor
    static let indigo300 = Palette.indigo300.color
    static let universalIndigo300 = Palette.indigo300.universalColor
    static let indigo400 = Palette.indigo400.color
    static let universalIndigo400 = Palette.indigo400.universalColor
    static let indigo500 = Palette.indigo500.color
    static let universalIndigo500 = Palette.indigo500.universalColor
    static let indigo600 = Palette.indigo600.color
    static let universalIndigo600 = Palette.indigo600.universalColor
    static let indigo700 = Palette.indigo700.color
    static let universalIndigo700 = Palette.indigo700.universalColor
    static let indigo800 = Palette.indigo800.color
    static let universalIndigo800 = Palette.indigo800.universalColor
    static let indigo900 = Palette.indigo900.color
    static let universalIndigo900 = Palette.indigo900.universalColor
    static let indigo950 = Palette.indigo950.color
    static let universalIndigo950 = Palette.indigo950.universalColor
    
    // Violet
    static let violet50 = Palette.violet50.color
    static let universalViolet50 = Palette.violet50.universalColor
    static let violet100 = Palette.violet100.color
    static let universalViolet100 = Palette.violet100.universalColor
    static let violet200 = Palette.violet200.color
    static let universalViolet200 = Palette.violet200.universalColor
    static let violet300 = Palette.violet300.color
    static let universalViolet300 = Palette.violet300.universalColor
    static let violet400 = Palette.violet400.color
    static let universalViolet400 = Palette.violet400.universalColor
    static let violet500 = Palette.violet500.color
    static let universalViolet500 = Palette.violet500.universalColor
    static let violet600 = Palette.violet600.color
    static let universalViolet600 = Palette.violet600.universalColor
    static let violet700 = Palette.violet700.color
    static let universalViolet700 = Palette.violet700.universalColor
    static let violet800 = Palette.violet800.color
    static let universalViolet800 = Palette.violet800.universalColor
    static let violet900 = Palette.violet900.color
    static let universalViolet900 = Palette.violet900.universalColor
    static let violet950 = Palette.violet950.color
    static let universalViolet950 = Palette.violet950.universalColor
    
    // Purple
    static let purple50 = Palette.purple50.color
    static let universalPurple50 = Palette.purple50.universalColor
    static let purple100 = Palette.purple100.color
    static let universalPurple100 = Palette.purple100.universalColor
    static let purple200 = Palette.purple200.color
    static let universalPurple200 = Palette.purple200.universalColor
    static let purple300 = Palette.purple300.color
    static let universalPurple300 = Palette.purple300.universalColor
    static let purple400 = Palette.purple400.color
    static let universalPurple400 = Palette.purple400.universalColor
    static let purple500 = Palette.purple500.color
    static let universalPurple500 = Palette.purple500.universalColor
    static let purple600 = Palette.purple600.color
    static let universalPurple600 = Palette.purple600.universalColor
    static let purple700 = Palette.purple700.color
    static let universalPurple700 = Palette.purple700.universalColor
    static let purple800 = Palette.purple800.color
    static let universalPurple800 = Palette.purple800.universalColor
    static let purple900 = Palette.purple900.color
    static let universalPurple900 = Palette.purple900.universalColor
    static let purple950 = Palette.purple950.color
    static let universalPurple950 = Palette.purple950.universalColor
    
    // Fuchsia
    static let fuchsia50 = Palette.fuchsia50.color
    static let universalFuchsia50 = Palette.fuchsia50.universalColor
    static let fuchsia100 = Palette.fuchsia100.color
    static let universalFuchsia100 = Palette.fuchsia100.universalColor
    static let fuchsia200 = Palette.fuchsia200.color
    static let universalFuchsia200 = Palette.fuchsia200.universalColor
    static let fuchsia300 = Palette.fuchsia300.color
    static let universalFuchsia300 = Palette.fuchsia300.universalColor
    static let fuchsia400 = Palette.fuchsia400.color
    static let universalFuchsia400 = Palette.fuchsia400.universalColor
    static let fuchsia500 = Palette.fuchsia500.color
    static let universalFuchsia500 = Palette.fuchsia500.universalColor
    static let fuchsia600 = Palette.fuchsia600.color
    static let universalFuchsia600 = Palette.fuchsia600.universalColor
    static let fuchsia700 = Palette.fuchsia700.color
    static let universalFuchsia700 = Palette.fuchsia700.universalColor
    static let fuchsia800 = Palette.fuchsia800.color
    static let universalFuchsia800 = Palette.fuchsia800.universalColor
    static let fuchsia900 = Palette.fuchsia900.color
    static let universalFuchsia900 = Palette.fuchsia900.universalColor
    static let fuchsia950 = Palette.fuchsia950.color
    static let universalFuchsia950 = Palette.fuchsia950.universalColor
    
    // Pink
    static let pink50 = Palette.pink50.color
    static let universalPink50 = Palette.pink50.universalColor
    static let pink100 = Palette.pink100.color
    static let universalPink100 = Palette.pink100.universalColor
    static let pink200 = Palette.pink200.color
    static let universalPink200 = Palette.pink200.universalColor
    static let pink300 = Palette.pink300.color
    static let universalPink300 = Palette.pink300.universalColor
    static let pink400 = Palette.pink400.color
    static let universalPink400 = Palette.pink400.universalColor
    static let pink500 = Palette.pink500.color
    static let universalPink500 = Palette.pink500.universalColor
    static let pink600 = Palette.pink600.color
    static let universalPink600 = Palette.pink600.universalColor
    static let pink700 = Palette.pink700.color
    static let universalPink700 = Palette.pink700.universalColor
    static let pink800 = Palette.pink800.color
    static let universalPink800 = Palette.pink800.universalColor
    static let pink900 = Palette.pink900.color
    static let universalPink900 = Palette.pink900.universalColor
    static let pink950 = Palette.pink950.color
    static let universalPink950 = Palette.pink950.universalColor
    
    static let ring = named("ring")
    
    // Helper function to get the Color from assets
    private static func named(_ name: String) -> Color {
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        .init(nsColor: NSColor(named: name, bundle: .module)!)
        #else
        .init(uiColor: UIColor(named: name, in: .module, compatibleWith: nil)!)
        #endif
    }
    
    static func / (left: Color, right: Int) -> Color {
        left.opacity(Double(right) / 100)
    }
}

public extension ShapeStyle where Self == Color {
    // Slate
    static var slate50: Color { .slate50 }
    static var universalSlate50: Color { .universalSlate50 }
    static var slate100: Color { .slate100 }
    static var universalSlate100: Color { .universalSlate100 }
    static var slate200: Color { .slate200 }
    static var universalSlate200: Color { .universalSlate200 }
    static var slate300: Color { .slate300 }
    static var universalSlate300: Color { .universalSlate300 }
    static var slate400: Color { .slate400 }
    static var universalSlate400: Color { .universalSlate400 }
    static var slate500: Color { .slate500 }
    static var universalSlate500: Color { .universalSlate500 }
    static var slate600: Color { .slate600 }
    static var universalSlate600: Color { .universalSlate600 }
    static var slate700: Color { .slate700 }
    static var universalSlate700: Color { .universalSlate700 }
    static var slate800: Color { .slate800 }
    static var universalSlate800: Color { .universalSlate800 }
    static var slate900: Color { .slate900 }
    static var universalSlate900: Color { .universalSlate900 }
    static var slate950: Color { .slate950 }
    static var universalSlate950: Color { .universalSlate950 }
    
    // Teal
    static var teal50: Color { .teal50 }
    static var universalTeal50: Color { .universalTeal50 }
    static var teal100: Color { .teal100 }
    static var universalTeal100: Color { .universalTeal100 }
    static var teal200: Color { .teal200 }
    static var universalTeal200: Color { .universalTeal200 }
    static var teal300: Color { .teal300 }
    static var universalTeal300: Color { .universalTeal300 }
    static var teal400: Color { .teal400 }
    static var universalTeal400: Color { .universalTeal400 }
    static var teal500: Color { .teal500 }
    static var universalTeal500: Color { .universalTeal500 }
    static var teal600: Color { .teal600 }
    static var universalTeal600: Color { .universalTeal600 }
    static var teal700: Color { .teal700 }
    static var universalTeal700: Color { .universalTeal700 }
    static var teal800: Color { .teal800 }
    static var universalTeal800: Color { .universalTeal800 }
    static var teal900: Color { .teal900 }
    static var universalTeal900: Color { .universalTeal900 }
    static var teal950: Color { .teal950 }
    static var universalTeal950: Color { .universalTeal950 }
    
    // Cyan
    static var cyan50: Color { .cyan50 }
    static var universalCyan50: Color { .universalCyan50 }
    static var cyan100: Color { .cyan100 }
    static var universalCyan100: Color { .universalCyan100 }
    static var cyan200: Color { .cyan200 }
    static var universalCyan200: Color { .universalCyan200 }
    static var cyan300: Color { .cyan300 }
    static var universalCyan300: Color { .universalCyan300 }
    static var cyan400: Color { .cyan400 }
    static var universalCyan400: Color { .universalCyan400 }
    static var cyan500: Color { .cyan500 }
    static var universalCyan500: Color { .universalCyan500 }
    static var cyan600: Color { .cyan600 }
    static var universalCyan600: Color { .universalCyan600 }
    static var cyan700: Color { .cyan700 }
    static var universalCyan700: Color { .universalCyan700 }
    static var cyan800: Color { .cyan800 }
    static var universalCyan800: Color { .universalCyan800 }
    static var cyan900: Color { .cyan900 }
    static var universalCyan900: Color { .universalCyan900 }
    static var cyan950: Color { .cyan950 }
    static var universalCyan950: Color { .universalCyan950 }
    
    // Sky
    static var sky50: Color { .sky50 }
    static var universalSky50: Color { .universalSky50 }
    static var sky100: Color { .sky100 }
    static var universalSky100: Color { .universalSky100 }
    static var sky200: Color { .sky200 }
    static var universalSky200: Color { .universalSky200 }
    static var sky300: Color { .sky300 }
    static var universalSky300: Color { .universalSky300 }
    static var sky400: Color { .sky400 }
    static var universalSky400: Color { .universalSky400 }
    static var sky500: Color { .sky500 }
    static var universalSky500: Color { .universalSky500 }
    static var sky600: Color { .sky600 }
    static var universalSky600: Color { .universalSky600 }
    static var sky700: Color { .sky700 }
    static var universalSky700: Color { .universalSky700 }
    static var sky800: Color { .sky800 }
    static var universalSky800: Color { .universalSky800 }
    static var sky900: Color { .sky900 }
    static var universalSky900: Color { .universalSky900 }
    static var sky950: Color { .sky950 }
    static var universalSky950: Color { .universalSky950 }
    
    // Blue
    static var blue50: Color { .blue50 }
    static var universalBlue50: Color { .universalBlue50 }
    static var blue100: Color { .blue100 }
    static var universalBlue100: Color { .universalBlue100 }
    static var blue200: Color { .blue200 }
    static var universalBlue200: Color { .universalBlue200 }
    static var blue300: Color { .blue300 }
    static var universalBlue300: Color { .universalBlue300 }
    static var blue400: Color { .blue400 }
    static var universalBlue400: Color { .universalBlue400 }
    static var blue500: Color { .blue500 }
    static var universalBlue500: Color { .universalBlue500 }
    static var blue600: Color { .blue600 }
    static var universalBlue600: Color { .universalBlue600 }
    static var blue700: Color { .blue700 }
    static var universalBlue700: Color { .universalBlue700 }
    static var blue800: Color { .blue800 }
    static var universalBlue800: Color { .universalBlue800 }
    static var blue900: Color { .blue900 }
    static var universalBlue900: Color { .universalBlue900 }
    static var blue950: Color { .blue950 }
    static var universalBlue950: Color { .universalBlue950 }
    
    // Indigo
    static var indigo50: Color { .indigo50 }
    static var universalIndigo50: Color { .universalIndigo50 }
    static var indigo100: Color { .indigo100 }
    static var universalIndigo100: Color { .universalIndigo100 }
    static var indigo200: Color { .indigo200 }
    static var universalIndigo200: Color { .universalIndigo200 }
    static var indigo300: Color { .indigo300 }
    static var universalIndigo300: Color { .universalIndigo300 }
    static var indigo400: Color { .indigo400 }
    static var universalIndigo400: Color { .universalIndigo400 }
    static var indigo500: Color { .indigo500 }
    static var universalIndigo500: Color { .universalIndigo500 }
    static var indigo600: Color { .indigo600 }
    static var universalIndigo600: Color { .universalIndigo600 }
    static var indigo700: Color { .indigo700 }
    static var universalIndigo700: Color { .universalIndigo700 }
    static var indigo800: Color { .indigo800 }
    static var universalIndigo800: Color { .universalIndigo800 }
    static var indigo900: Color { .indigo900 }
    static var universalIndigo900: Color { .universalIndigo900 }
    static var indigo950: Color { .indigo950 }
    static var universalIndigo950: Color { .universalIndigo950 }
    
    // Violet
    static var violet50: Color { .violet50 }
    static var universalViolet50: Color { .universalViolet50 }
    static var violet100: Color { .violet100 }
    static var universalViolet100: Color { .universalViolet100 }
    static var violet200: Color { .violet200 }
    static var universalViolet200: Color { .universalViolet200 }
    static var violet300: Color { .violet300 }
    static var universalViolet300: Color { .universalViolet300 }
    static var violet400: Color { .violet400 }
    static var universalViolet400: Color { .universalViolet400 }
    static var violet500: Color { .violet500 }
    static var universalViolet500: Color { .universalViolet500 }
    static var violet600: Color { .violet600 }
    static var universalViolet600: Color { .universalViolet600 }
    static var violet700: Color { .violet700 }
    static var universalViolet700: Color { .universalViolet700 }
    static var violet800: Color { .violet800 }
    static var universalViolet800: Color { .universalViolet800 }
    static var violet900: Color { .violet900 }
    static var universalViolet900: Color { .universalViolet900 }
    static var violet950: Color { .violet950 }
    static var universalViolet950: Color { .universalViolet950 }
    
    // Purple
    static var purple50: Color { .purple50 }
    static var universalPurple50: Color { .universalPurple50 }
    static var purple100: Color { .purple100 }
    static var universalPurple100: Color { .universalPurple100 }
    static var purple200: Color { .purple200 }
    static var universalPurple200: Color { .universalPurple200 }
    static var purple300: Color { .purple300 }
    static var universalPurple300: Color { .universalPurple300 }
    static var purple400: Color { .purple400 }
    static var universalPurple400: Color { .universalPurple400 }
    static var purple500: Color { .purple500 }
    static var universalPurple500: Color { .universalPurple500 }
    static var purple600: Color { .purple600 }
    static var universalPurple600: Color { .universalPurple600 }
    static var purple700: Color { .purple700 }
    static var universalPurple700: Color { .universalPurple700 }
    static var purple800: Color { .purple800 }
    static var universalPurple800: Color { .universalPurple800 }
    static var purple900: Color { .purple900 }
    static var universalPurple900: Color { .universalPurple900 }
    static var purple950: Color { .purple950 }
    static var universalPurple950: Color { .universalPurple950 }
    
    // Fuchsia
    static var fuchsia50: Color { .fuchsia50 }
    static var universalFuchsia50: Color { .universalFuchsia50 }
    static var fuchsia100: Color { .fuchsia100 }
    static var universalFuchsia100: Color { .universalFuchsia100 }
    static var fuchsia200: Color { .fuchsia200 }
    static var universalFuchsia200: Color { .universalFuchsia200 }
    static var fuchsia300: Color { .fuchsia300 }
    static var universalFuchsia300: Color { .universalFuchsia300 }
    static var fuchsia400: Color { .fuchsia400 }
    static var universalFuchsia400: Color { .universalFuchsia400 }
    static var fuchsia500: Color { .fuchsia500 }
    static var universalFuchsia500: Color { .universalFuchsia500 }
    static var fuchsia600: Color { .fuchsia600 }
    static var universalFuchsia600: Color { .universalFuchsia600 }
    static var fuchsia700: Color { .fuchsia700 }
    static var universalFuchsia700: Color { .universalFuchsia700 }
    static var fuchsia800: Color { .fuchsia800 }
    static var universalFuchsia800: Color { .universalFuchsia800 }
    static var fuchsia900: Color { .fuchsia900 }
    static var universalFuchsia900: Color { .universalFuchsia900 }
    static var fuchsia950: Color { .fuchsia950 }
    static var universalFuchsia950: Color { .universalFuchsia950 }
    
    // Pink
    static var pink50: Color { .pink50 }
    static var universalPink50: Color { .universalPink50 }
    static var pink100: Color { .pink100 }
    static var universalPink100: Color { .universalPink100 }
    static var pink200: Color { .pink200 }
    static var universalPink200: Color { .universalPink200 }
    static var pink300: Color { .pink300 }
    static var universalPink300: Color { .universalPink300 }
    static var pink400: Color { .pink400 }
    static var universalPink400: Color { .universalPink400 }
    static var pink500: Color { .pink500 }
    static var universalPink500: Color { .universalPink500 }
    static var pink600: Color { .pink600 }
    static var universalPink600: Color { .universalPink600 }
    static var pink700: Color { .pink700 }
    static var universalPink700: Color { .universalPink700 }
    static var pink800: Color { .pink800 }
    static var universalPink800: Color { .universalPink800 }
    static var pink900: Color { .pink900 }
    static var universalPink900: Color { .universalPink900 }
    static var pink950: Color { .pink950 }
    static var universalPink950: Color { .universalPink950 }
}

#Preview {
    VStack {
        HStack {
            Color.slate50
            Color.universalSlate50
        }
        HStack {
            Color.slate100
            Color.universalSlate100
        }
    }
}
