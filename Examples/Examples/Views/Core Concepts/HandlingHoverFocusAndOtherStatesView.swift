//
//  HandlingHoverFocusAndOtherStatesView.swift
//  Examples
//
//  Created by Jiafu Zhang on 4/1/24.
//

import SwiftUI
import TailwindSwiftUI

struct HoverView: View {
    var body: some View {
        Button {} label: {
            Text("Save changes")
                .padding(.horizontal, .s5)
                .padding(.vertical, .s2)
                .hover(.background(.sky700), default: .background(.sky500))
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
    HoverView()
}

struct TraditionalHoverView: View {
    @State private var isHovering = false
    
    var body: some View {
        Button {} label: {
            Text("Save changes")
                .background(isHovering ? Color(red: 3 / 255, green: 105 / 255, blue: 161 / 255) : Color(red: 14 / 255, green: 165 / 255, blue: 233 / 255))
        }
        .onHover { hovering in
            isHovering = hovering
        }
    }
}

#Preview {
    TraditionalHoverView()
}

struct ModifiersView: View {
    var body: some View {
        Button {} label: {
            Text("Save changes")
        }
        .dark(.medium(.hover(.background(.fuchsia600))))
    }
}

#Preview {
    ModifiersView()
}
