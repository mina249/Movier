//
//  ImageType.swift
//  Movier
//
//  Created by Min Nageh on 19/01/2024.
//

import Foundation
enum ImageType{
    case cover
    case poster
    var heightPercent:CGFloat{
        switch self{
        case .poster:
            return 0.23
        case .cover:
            return 0.3
        }
    }
    var widthPercent:CGFloat{
        switch self {
        case .poster:
            return 0.32
        case .cover:
            return 0.97
        }
    }
}
