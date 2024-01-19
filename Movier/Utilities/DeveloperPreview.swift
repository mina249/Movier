//
//  DeveloperPreview.swift
//  Movier
//
//  Created by Min Nageh on 18/01/2024.
//

import Foundation
class DeveloperPreview{
    static let shared = DeveloperPreview()
    private init(){}
    
    var movie = Movie(adult: false,
                      imagePath: "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
                      genreIDS: [18,80],
                      id: 278,
                      originalLanguage: "en",
                      originalTitle: "The Shawshank Redemption",
                      overview: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                      popularity: 113.259,
                      moviePoster: "/lyQBXzOQSuE59IsHyhrp0qIiPAz.jpg",
                      releaseDate: "1994-09-23",
                      title: "The Shawshank Redemption",
                      video: false,
                      rating: 8.7,
                      voteCount: 25350)
    var url = URL(string: PListKeysManager.getValue(key: .imageUrl) + ImageSize.w185.rawValue + "/" + "/lyQBXzOQSuE59IsHyhrp0qIiPAz.jpg")
}
