//
//  StyleingBasedOnParentStateView.swift
//  Examples
//
//  Created by Jiafu Zhang on 4/2/24.
//

import SwiftUI
import TailwindSwiftUI

struct StylingBasedOnParentStateView: View {
    var body: some View {
        Link(destination: .init(string: "#")!) {
            VStack(alignment: .leading, spacing: .s3) {
                HStack(spacing: .s3) {
                    Image(systemName: "folder.badge.plus")
                        .groupHover(.foregroundStyle(.white))
                        .foregroundStyle(.sky500)
                    Text("New project")
                        .groupHover(.foregroundStyle(.white))
                        .foregroundStyle(.slate900)
                        .text(.small)
                        .fontWeight(.semibold)
                }
                Text("Create a new project from a variety of starting templates.")
                    .groupHover(.foregroundStyle(.white))
                    .foregroundStyle(.slate500)
                    .text(.small)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(.s6)
        .max(width: .extraSmall)
        .group()
        .hover(.background(.sky500))
        .background(.white)
        .hover(.ring(.sky500, thickness: .t1, rounded: .large), default: .ring(.slate900 / 5, thickness: .t1, rounded: .large))
        .rounded(.large)
        .shadow(.large)
        .cursorPointer()
        .padding(.horizontal, .s52)
        .padding(.vertical, .s10)
        .background(.universalSlate100)
    }
}

#Preview {
    StylingBasedOnParentStateView()
}
