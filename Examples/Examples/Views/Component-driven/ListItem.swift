//
//  ListItem.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/28/24.
//

import SwiftUI

struct ListItem: View {
    let movie: Movie
    
    var body: some View {
        HStack(spacing: .s6) {
            Image(movie.image)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 88)
                .background(.slate100)
                .rounded(.medium)
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(movie.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.slate900)
                        .padding(.trailing, .s20)
                    Spacer()
                    HStack(spacing: .s1) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.sky500)
                        Text(movie.starRating.description)
                    }
                }
                HStack(spacing: 0) {
                    Text(movie.rating)
                        .accessibilityLabel("Rating")
                        .padding(.s1_5)
                        .ring(.slate200, thickness: .t1, rounded: .base)
                    Text(movie.year.description)
                        .accessibilityLabel("Year")
                        .padding(.leading, .s2)
                    HStack(spacing: 0) {
                        Circle()
                            .frame(width: 2)
                            .padding(.horizontal, .s2)
                            .foregroundStyle(.slate300)
                            .accessibilityHidden(true)
                        Text(movie.genre)
                    }
                    .accessibilityLabel("Genre")
                    HStack(spacing: 0) {
                        Circle()
                            .frame(width: 2)
                            .padding(.horizontal, .s2)
                            .foregroundStyle(.slate300)
                            .accessibilityHidden(true)
                        Text(String(format: "%dh %dm", movie.runTime / 60, movie.runTime % 60))
                    }
                    .accessibilityLabel("Runtime")
                }
                .padding(.top, .s2)
                .text(.small, leading: 6)
                .fontWeight(.medium)
                Text(movie.cast)
                    .padding(.top, .s2)
                    .font(.body)
                    .accessibilityLabel("Cast")
                    .foregroundStyle(.slate400)
            }
            .frame(minWidth: 0)
        }
        .padding(.s6)
    }
}

#Preview {
    ListItem(movie: .init(
        image: "1960-Ocean’s-11-advertising-movie-poster-1170x1715",
        title: "Ocean's Eleven",
        starRating: 6.5,
        rating: "Approved",
        year: 1960,
        genre: "Comedy",
        runTime: 127,
        cast: "Frank Sinatra, Dean Martin, Sammy Davis Jr."
    ))
}
