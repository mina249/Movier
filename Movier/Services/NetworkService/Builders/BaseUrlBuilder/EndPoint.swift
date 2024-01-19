//
//  EndPoint.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import Foundation
enum EndPoint : String,CaseIterable{
    case popular = "popular"
    case topRated = "top_rated"
    
    var sortingName:String{
        switch self {
        case .popular:
            "Popular"
        case .topRated:
            "Top Rated"
        }
    }
}
