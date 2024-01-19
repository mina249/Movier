//
//  ImageUrlConstructor.swift
//  Movier
//
//  Created by Min Nageh on 18/01/2024.
//

import Foundation
struct ImageUrlBuilder{
    
    private static var imageBaseUrl:String{
        PListKeysManager.getValue(key: .imageUrl)
    }
    static func build(_ urlConstrucor:ImageUrlConstructor) throws -> URL{
        let stringImageUrl = imageBaseUrl + urlConstrucor.fullPath
        guard let imageUrl =  URL(string: stringImageUrl) else{
            throw NetworkErrors.inavlidUrl
        }
        return imageUrl
    }
    
    
}
