//
//  ApiUrlBuilder.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import Foundation
struct ApiUrlBuilder{
    private static var apiKey:String{
        PListKeysManager.getValue(key: .apiKey)
    }
    
    static func build(api:ApiUrlConstructor) throws -> URL{
        guard var urlComponents = URLComponents(string: api.fullPath())else{
            throw NetworkErrors.invalidPath
        }
        urlComponents.queryItems = buildParameters(api.params,["api_key": apiKey])
        guard let apiUrl = urlComponents.url else{
            throw NetworkErrors.inavlidUrl
        }
        print(apiUrl)
        return apiUrl
    }
    
    private static func buildParameters(_ params: Parametes...) -> [URLQueryItem]{
        params.flatMap{$0}.map{
            URLQueryItem(name: $0.key, value: $0.value)
        }
    }
    
}

