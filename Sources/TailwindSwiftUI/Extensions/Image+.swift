//
//  Image+.swift
//
//
//  Created by Jiafu Zhang on 3/30/24.
//

import SwiftUI

public extension Image {
    @MainActor func sepia() -> Self {
        let renderer = ImageRenderer(content: self)
        let filter = CIFilter.sepiaTone()
        guard let cgImage = renderer.cgImage else {
            return self
        }
        filter.setValue(CIImage(cgImage: cgImage), forKey: kCIInputImageKey)
        guard let outputImage = filter.outputImage else {
            return self
        }
        let context = CIContext()
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return self
        }
        #if canImport(AppKit)
        return Image(nsImage: NSImage(cgImage: cgImage, size: .zero))
        #else
        return Image(uiImage: UIImage(cgImage: cgImage))
        #endif
    }
}
