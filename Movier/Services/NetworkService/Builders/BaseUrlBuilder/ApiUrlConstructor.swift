//
//  ApiUrlConstructor.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import Foundation
typealias Parametes = [String:String]

struct ApiUrlConstructor{
    let endPoint:EndPoint
    var params : Parametes = [:]
    
    func fullPath() -> String{
        return PListKeysManager.getValue(key: .apiUrl) + endPoint.rawValue
    }
}
