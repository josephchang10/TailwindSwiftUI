//
//  Movie.swift
//  Examples
//
//  Created by Jiafu Zhang on 3/28/24.
//

import Foundation

struct Movie {
    let id = UUID()
    let image: String
    let title: String
    let starRating: Float
    let rating: String
    let year: Int
    let genre: String
    let runTime: Int
    let cast: String
}

let movies = [
    Movie(
        image: "1960-Ocean’s-11-advertising-movie-poster-1170x1715",
        title: "Ocean's Eleven",
        starRating: 6.5,
        rating: "Approved",
        year: 1960,
        genre: "Comedy",
        runTime: 127,
        cast: "Frank Sinatra, Dean Martin, Sammy Davis Jr."
    ),
    Movie(
        image: "Vertigo-Alfred-Hitchcock-1958-1170x1700",
        title: "Vertigo",
        starRating: 8.3,
        rating: "PG",
        year: 1958,
        genre: "Mystery",
        runTime: 128,
        cast: "James Stewart, Kim Novak, Barbara Bel Geddes"
    ),
    Movie(
        image: "Big-Jake-Vintage-Film-Poster-1971",
        title: "Big Jake",
        starRating: 7.1,
        rating: "PG-13",
        year: 1971,
        genre: "Drama",
        runTime: 110,
        cast: "John Wayne, Richard Boone, Maureen O'Hara"
    )
]
