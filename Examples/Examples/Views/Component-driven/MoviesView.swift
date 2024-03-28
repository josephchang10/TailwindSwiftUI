//
//  MoviesView.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/28/24.
//

import SwiftUI
import TailwindSwiftUI

struct MoviesView: View {
    var body: some View {
        VStack(spacing: 0) {
            Divide(.slate100) {
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
                ListView {
                    ForEach(movies, id: \.id) { movie in
                        ListItem(movie: movie)
                    }
                }
            }
        }
        .foregroundStyle(.slate500)
        .background(.white)
    }
}

#Preview {
    MoviesView()
}
