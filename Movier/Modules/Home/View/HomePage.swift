//
//  HomePage.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import SwiftUI

struct HomePage: View {
    @StateObject var homeVM = HomeViewModel()
    @StateObject var coOrdinator = CoOrdinator()
    @State private var networkMonitor = NetworkMonitor()
    var body: some View {
            NavigationStack{
                header
                sorting
                moviesGrid
            }.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .accentColor(.white)
    }
}

extension HomePage{
    var header : some View {
        LazyVStack(alignment: .leading){
            HStack{
                Text("Welcome To ")
                    .font(.title2)
                    .fontWeight(.bold)
                Image("splashImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
            }.padding()
        }
    }
}

extension HomePage{
    var sorting : some View{
        HStack{
            ForEach(EndPoint.allCases, id: \.self){ endPoint in
                SortingCard(endPoint: endPoint, selectedSortType: $homeVM.selectedSortType)
                    .onTapGesture {
                        withAnimation(.bouncy){
                            networkMonitor.startMonitoring()
                            homeVM.selectedSortType = endPoint
                            homeVM.resetMoviesList()
                            homeVM.updateMoviesListWithNextPage()
                        }
                    }
            }.padding([.trailing,.leading])
            
        }.padding(.bottom,5)
        
    }
}

extension HomePage{
    var moviesGrid:some View{
        ScrollView(showsIndicators: false){
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())],spacing: 20){
                ForEach(homeVM.movies){ movie in
                    NavigationLink(destination: DetailsPage(detailsVM: homeVM.BuildDeatailsViewModel(with: movie)) ){
                        MovieCard(movie: movie, imageUrl: homeVM.getMoviePosterUrl(imageSize: .w185, movie.moviePoster))
                            .onAppear{
                                if homeVM.isLastMovie(movie){
                                    homeVM.updateMoviesListWithNextPage()
                                }
                            }
                    }
                }
            }
            .onAppear{
                networkMonitor.startMonitoring()
                homeVM.updateMoviesListWithNextPage()
            }
            .onDisappear{
                networkMonitor.stopMonitoring()
            }
        }.alert(isPresented: $homeVM.hasError, error: homeVM.networkError, actions: {
            
        })
        .alert("no network please try again later", isPresented: $networkMonitor.notConnected, actions: {
            Button("retry"){
                networkMonitor.startMonitoring()
            }
        })
        .accentColor(.white)
        
    }
}

#Preview {
    HomePage()
}
