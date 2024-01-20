//
//  RemoteDataSource.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import Foundation
actor RemoteDataSource : DataSource {
    static let shared = RemoteDataSource()
    private init(){}
    
    func fetchMovies<responseData:Codable>(api: ApiUrlConstructor) async throws -> responseData{
        do{
            let movieUrl =  try ApiUrlBuilder.build(api: api)
            let (moviesData , response) = try await URLSession.shared.data(from: movieUrl)
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                throw NetworkErrors.responseError
            }
            return try decodeData(responseData.self ,moviesData)
            
        }catch NetworkErrors.inavlidUrl{
            throw NetworkErrors.inavlidUrl
        }catch NetworkErrors.invalideModel{
            throw NetworkErrors.invalideModel
        }
        
    }
    private func decodeData <T:Decodable>(_ dataModel : T.Type , _ moviesData:Data) throws -> T{
        do{
            return try JSONDecoder().decode(T.self,from: moviesData)
        }catch{
            throw NetworkErrors.invalideModel
        }
    }
}

