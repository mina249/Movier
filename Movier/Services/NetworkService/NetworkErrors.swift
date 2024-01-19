//
//  NetworkErrors.swift
//  Movier
//
//  Created by Min Nageh on 19/01/2024.
//

import Foundation
enum NetworkErrors:LocalizedError{
    case responseError
    case invalideModel
    case invalidPath
    case inavlidUrl
    case unKnownError
}
extension NetworkErrors{
    var errorDescription: String?{
        switch self {
        case .inavlidUrl: Constants.INVALID_URL
        case .invalidPath:
            Constants.INVALID_URL
        case .invalideModel:
            Constants.INVALID_MODEL
        case .responseError:
            Constants.INVALID_RESPONSE
        case.unKnownError:
            Constants.UNKNOW_ERROR
            
        }
    }
}
