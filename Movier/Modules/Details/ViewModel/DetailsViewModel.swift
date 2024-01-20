//
//  DetailsViewModel.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import Foundation

class DetailsViewModel:ObservableObject{
    @Published var hasError = false
    @Published var networkError: NetworkErrors?
    @Published var selectedMovie:Movie?
    
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
}
