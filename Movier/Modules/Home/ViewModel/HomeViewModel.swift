//
//  HomeViewModel.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import Foundation
class HomeViewModel:ObservableObject{
    @Published var movies : [Movie] = []
    let homeRepository = HomeDataRepository(remoteDataSource: RemoteDataSource.shared)
   
    func getMovies(endPoint:EndPoint,page:Int32) async {
        let api = ApiUrlConstructor(endPoint: endPoint, params: ["page":String(page)])
        do{
            let moveiesResponse:MovieResponse = try await homeRepository.getHomeMovies(api: api)
            await MainActor.run{
                movies = moveiesResponse.movies
            }
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
}
