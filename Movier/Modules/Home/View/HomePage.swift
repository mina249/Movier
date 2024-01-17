//
//  HomePage.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import SwiftUI

struct HomePage: View {
    
    @StateObject var vm = HomeViewModel()
    var body: some View {
        NavigationView {
            List(vm.movies) { movis in
                       // Each row in the list
                Text(movis.title)
            }.task {
                await vm.getMovies(endPoint: .topRated, page: 2)
                   }
                   .navigationTitle("Sample List")
        }
           }
    
}

#Preview {
    HomePage()
}
