//
//  Width.swift
//
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI

public struct Width: ViewModifier {
    public enum WScale {
        case small
        case full
        case half
        
        var size: CGFloat? {
            switch self {
            case .small:
                24
            default:
                nil
            }
        }
    }
    
    @State private var width: CGFloat?
    var scale: Scale?
    var wScale: WScale?
    var alignment: Alignment = .center
    
    public func body(content: Content) -> some View {
        if let scale {
            content
                .width(scale)
        } else if let wScale {
            switch wScale {
            case .half:
                content
                    .frame(width: width != nil ? width! / 2 : nil, alignment: alignment)
                    .overlay {
                        if wScale == .half {
                            GeometryReader { proxy in
                                Color.clear
                                    .onAppear {
                                        width = proxy.size.width
                                    }
                            }
                        }
                    }
            case .full:
                content
                    .frame(maxWidth: .infinity, alignment: alignment)
            default:
                content
                    .frame(maxWidth: wScale.size, alignment: alignment)
            }
        } else {
            content
        }
    }
}

public extension ViewModifier where Self == Width {
    static func width(_ scale: Scale, alignment: Alignment = .center) -> Self {
        Self(scale: scale, alignment: alignment)
    }
    
    static func width(_ scale: Width.WScale, alignment: Alignment = .center) -> Self {
        Self(wScale: scale, alignment: alignment)
    }
}

public extension View {
    func width(_ scale: Scale) -> some View {
        frame(width: .scale(scale))
    }
    
    func width(_ scale: Width.WScale, alignment: Alignment = .center) -> some View {
        modifier(Width(wScale: scale, alignment: alignment))
    }
}
