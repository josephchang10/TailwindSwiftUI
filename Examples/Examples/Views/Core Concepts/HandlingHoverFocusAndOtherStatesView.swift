//
//  HandlingHoverFocusAndOtherStatesView.swift
//  Examples
//
//  Created by Jiafu Zhang on 4/1/24.
//

import SwiftUI

struct HandlingHoverFocusAndOtherStatesView: View {
    var body: some View {
        Button {} label: {
            Text("Save changes")
                .padding(.horizontal, .s5)
                .padding(.vertical, .s2)
                .hover(.background(.sky700), otherwise: .background(.sky500))
                .text(.small, leading: 5)
                .rounded(.full)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .cursorPointer()
        .buttonStyle(.plain)
        .padding(.horizontal, .s64)
        .padding(.vertical, .s10)
        .background(.universalSlate100)
    }
}

#Preview {
    HandlingHoverFocusAndOtherStatesView()
}
