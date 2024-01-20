//
//  Constants.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import Foundation
class Constants{
    static let MOVIE_CARD_WIDHT_PRECENT = 0.32
    static let MOVEI_CARD_HEIGHT_PERCENT = 0.23
    static let SORTING_CARD_WIDHT_PERCENT = 0.4
    static let SORTING_CARD_HEIGHT_PERCENT = 0.05
    static let INVALID_URL = "The used URL is not valid"
    static let INVALID_MODEL = "There is change in movies data,we are working on it, please try again later"
    static let INVALID_RESPONSE = "Countering Server error, please try again later"
    static let UNKNOW_ERROR = "Somethng went wrong plaese try again later"
    static let ERROR = "ERROR"
    
   static func formateReleaseDate(_ date:String) -> String{
       let dateParts = date.split(separator: "-")
        var formatedDate = ""
        for index in (0..<dateParts.count).reversed(){
            let cuurent = dateParts[index]
            formatedDate.append(cuurent + "-")
        }
        formatedDate.removeLast()
        return formatedDate
    }
    
    static func formateRating(_ rating:Double)->String{
        let formatedRate = String(format: "%.1f", rating)
        return  formatedRate
    }
    
}
