//
//  HoverViewModifierView.swift
//  Examples
//
//  Created by Jiafu Zhang on 4/2/24.
//

import SwiftUI

struct HoverViewModifierView: View {
    var body: some View {
        Button {} label: {
            Text("Save changes")
                .padding(.horizontal, .s5)
                .padding(.vertical, .s2)
                .text(.small, leading: 5)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .hover(.background(.violet600), default: .background(.violet500))
        .buttonStyle(.active(.background(.violet700)))
        .rounded(.full)
        .cursorPointer()
        .padding(.horizontal, .s64)
        .padding(.vertical, .s10)
        .background(.universalSlate100)
    }
}

#Preview {
    HoverViewModifierView()
}
