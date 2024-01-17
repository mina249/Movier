//
//  MovieResponse.swift
//  Movier
//
//  Created by Min Nageh on 17/01/2024.
//

import Foundation
struct MovieResponse: Codable {
    let page: Int
    let movies : [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
