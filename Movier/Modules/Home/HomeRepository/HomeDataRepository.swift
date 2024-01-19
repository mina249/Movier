//
//  HomeDataRepository.swift
//  Movier
//
//  Created by Min Nageh on 17/01/2024.
//

import Foundation
class HomeDataRepository:HomeRepository{
    let remoteDataSource:DataSource
    init(remoteDataSource: DataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getHomeMovies<T:Codable>(api: ApiUrlConstructor) async throws -> T {
        do{
            return try await remoteDataSource.fetchMovies(api: api)
        }catch NetworkErrors.inavlidUrl{
            throw NetworkErrors.inavlidUrl
        }catch NetworkErrors.responseError{
            throw NetworkErrors.responseError
        }catch NetworkErrors.invalideModel{
            throw NetworkErrors.invalideModel
        }
    }
    
    
}
