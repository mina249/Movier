//
//  PListKeys.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import Foundation
enum PListKeysManager {
    enum PListKeys : String {
        case apiUrl = "API_BASE_URL"
        case imageUrl = "IMAGE_BASE_URL"
        case apiKey = "API_KEY"
    }
    static func getValue(key:PListKeys) ->  String{
        guard let keyValue = Bundle.main.infoDictionary?[key.rawValue] as? String else{
            fatalError("key: \(key.rawValue) is not found")
        }
        return keyValue
    }
}
