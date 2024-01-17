//
//  DataSource.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import Foundation
protocol DataSource{
    func fetchMovies <responseData:Codable>(api:ApiUrlConstructor) async throws -> responseData
}
