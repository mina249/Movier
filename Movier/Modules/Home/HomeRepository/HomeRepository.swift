//
//  HomeRepository.swift
//  Movier
//
//  Created by Min Nageh on 17/01/2024.
//

import Foundation
protocol HomeRepository{
    func getHomeMovies<T:Codable>(api:ApiUrlConstructor) async throws -> T
}
