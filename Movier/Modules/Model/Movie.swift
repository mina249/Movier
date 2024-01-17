//
//  Movie.swift
//  Movier
//
//  Created by Min Nageh on 17/01/2024.
//

import Foundation

struct Movie: Codable , Identifiable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let moviePoster, releaseDate, title: String
    let video: Bool
    let rating: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case moviePoster = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case rating = "vote_average"
        case voteCount = "vote_count"
    }
}
