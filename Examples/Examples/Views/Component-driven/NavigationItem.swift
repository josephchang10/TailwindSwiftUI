//
//  NavigationItem.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/28/24.
//

import SwiftUI

struct NavigationItem<Content: View>: View {
    let url: URL
    let isActive: Bool
    let content: Content
    
    var body: some View {
        Link(destination: url) {
            content
        }
        .padding(.horizontal, .s3)
        .padding(.vertical, .s2)
        .if(isActive) { view in
            view
                .background(.sky500)
                .foregroundStyle(.white)
        } or: { view in
            view
                .background(.slate50)
        }
        .rounded(.medium)
        .cursorPointer()
    }
    
    init(url: URL, isActive: Bool, @ViewBuilder _ content: () -> Content) {
        self.url = url
        self.isActive = isActive
        self.content = content()
    }
}

#Preview {
    NavigationItem(url: .init(string: "/new")!, isActive: true) {
        Text("New Releases")
    }
}

#Preview {
    NavigationItem(url: .init(string: "/new")!, isActive: false) {
        Text("New Releases")
    }
}
