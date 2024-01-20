//
//  HomeViewModel.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import Foundation
class HomeViewModel:ObservableObject{
    @Published var movies : [Movie] = []
    @Published var selectedSortType = EndPoint.popular
    @Published var hasError = false
    @Published var networkError :NetworkErrors?
    
    

    var pageNumber:Int = 0
    var maxPagenumber:Int = 6
    let homeRepository = HomeDataRepository(remoteDataSource: RemoteDataSource.shared)
   @MainActor
    func getMovies(endPoint:EndPoint,forPage pageNumber:Int) async {
            let api = ApiUrlConstructor(endPoint: selectedSortType, params: ["page":String(pageNumber)])
            do{
                let moveiesResponse:MovieResponse = try await homeRepository.getHomeMovies(api: api)
                    movies.append(contentsOf: moveiesResponse.movies)
                    //maxPagenumber = moveiesResponse.totalPages
            }catch let error{
                hasError = true
                networkError = error as? NetworkErrors
            }
    }
    
    func updateMoviesListWithNextPage(){
        pageNumber += 1
        if(pageNumber <= maxPagenumber){
            Task{
                await getMovies(endPoint: selectedSortType, forPage: pageNumber)
            }
        }
    }
    
    func getMoviePosterUrl(imageSize:ImageSize , _ posterUrl:String) -> URL{
        let urlConstructor = ImageUrlConstructor(size: imageSize, path: posterUrl)
        do{
            let url =  try ImageUrlBuilder.build(urlConstructor)
            return url
        }catch let error{
           hasError = true
           networkError = error as? NetworkErrors
            
        }
        return URL(string: "")!
    }
    
    func resetMoviesList(){
        pageNumber = 0
        movies = []
    }
    func isLastMovie(_ movie:Movie)->Bool{
        movie.id == movies.last?.id
    }
    
    func BuildDeatailsViewModel(with movie:Movie)-> DetailsViewModel{
        let detailsVm = DetailsViewModel()
        detailsVm.selectedMovie = movie
        return detailsVm
    }
}
