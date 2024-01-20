//
//  CoOrdinator.swift
//  Movier
//
//  Created by Min Nageh on 20/01/2024.
//

import SwiftUI
class Coordinator:ObservableObject{
    @Published var path = NavigationPath()
    @Published var deatilsVM:DetailsViewModel?
    
    func pushDetailsPage(_ detailsVM:DetailsViewModel){
        self.deatilsVM = detailsVM
        path.append(Pages.details.id)
    }
    func popToHome(){
        path.removeLast(path.count)
    }
    @ViewBuilder
    func buildpage(_ page:Pages)-> some View{
        switch page{
        case .home:
            HomePage()
        case .details:
            DetailsPage()
        }
    }
}

enum Pages:String,Identifiable{
    case home
    case details
    var id:String{
        self.rawValue
    }
}
