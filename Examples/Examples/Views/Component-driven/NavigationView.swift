//
//  NavigationView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/28/24.
//

import SwiftUI

struct NavigationView<Content: View>: View {
    let content: Content
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: .s3) {
                content
            }
        }
        .padding(.all, .s6)
        .text(.small)
        .fontWeight(.medium)
    }
    
    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
}

#Preview {
    NavigationView {
        NavigationItem(url: .init(string: "/new")!, isActive: true) {
            Text("New Releases")
        }
        NavigationItem(url: .init(string: "/top")!, isActive: false) {
            Text("Top Rated")
        }
        NavigationItem(url: .init(string: "/picks")!, isActive: false) {
            Text("Vincent's Picks")
        }
    }
}
