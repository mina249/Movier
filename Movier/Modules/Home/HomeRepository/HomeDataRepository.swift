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
        }catch ApiUrlBuilderError.inavlidUrl{
            throw ApiUrlBuilderError.inavlidUrl
        }catch NetworkError.responseError{
            throw NetworkError.responseError
        }catch NetworkError.invalideModel{
            throw NetworkError.invalideModel
        }
    }
    
    
}
