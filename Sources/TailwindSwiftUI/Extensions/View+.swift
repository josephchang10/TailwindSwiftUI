//
//  File.swift
//
//
//  Created by Jiafu Zhang on 3/15/24.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

public extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder func `if`<TrueContent: View, FalseContent: View>(_ condition: Bool, then ifTransform: (Self) -> TrueContent, or elseTransform: (Self) -> FalseContent) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }
  
    func `if`(_ condition: Bool, _ modifier: some ViewModifier) -> some View {
        condition ? AnyView(self.modifier(modifier)) : AnyView(self)
    }
    
    func justifyEnd() -> some View {
        frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func cursorPointer() -> some View {
        modifier(CursorPointer())
    }
    
    func blur() -> some View {
        blur(radius: 8)
    }
    
    func grayscale() -> some View {
        grayscale(1)
    }
    
    @MainActor func sepia() -> some View {
        let renderer = ImageRenderer(content: self)
        let filter = CIFilter.sepiaTone()
        guard let cgImage = renderer.cgImage else {
            return AnyView(self)
        }
        filter.setValue(CIImage(cgImage: cgImage), forKey: kCIInputImageKey)
        guard let outputImage = filter.outputImage else {
            return AnyView(self)
        }
        let context = CIContext()
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return AnyView(self)
        }
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        return AnyView(Image(nsImage: NSImage(cgImage: cgImage, size: .zero)))
        #else
        return AnyView(Image(uiImage: UIImage(cgImage: cgImage)))
        #endif
    }
}

struct CursorPointer: ViewModifier {
    @State private var isHovering = false
    
    func body(content: Content) -> some View {
        content
            .onHover { hovering in
                isHovering = hovering
            }
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
            .onChange(of: isHovering) { oldValue, newValue in
                DispatchQueue.main.async {
                    if newValue {
                        NSCursor.pointingHand.push()
                    } else {
                        NSCursor.pop()
                    }
                }
            }
        #endif
    }
}

#Preview {
    Text("Hello")
        .foregroundStyle(.yellow)
        .sepia()
}
