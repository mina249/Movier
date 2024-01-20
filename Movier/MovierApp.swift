//
//  MovierApp.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import SwiftUI

@main
struct MovierApp: App {
    init(){
        UINavigationBar().topItem?.leftBarButtonItem?.tintColor = .white
    }
    var body: some Scene {
        WindowGroup {
            CoOrdinatorView()
                
        }
    }
}
