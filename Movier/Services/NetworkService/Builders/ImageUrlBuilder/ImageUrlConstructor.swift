//
//  ImageUrlConstructor.swift
//  Movier
//
//  Created by Min Nageh on 18/01/2024.
//

import Foundation
struct ImageUrlConstructor{
    var size:ImageSize
    var path:String
    var fullPath:String{
       size.rawValue + "/" + path
   }
}
