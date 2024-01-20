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
    @State private var networkMonitor = NetworkManager()
    var body: some View {
            NavigationStack{
                LazyVStack(alignment: .leading){
                    Text("Welcome To Movier")
                        .padding()
                        .fontWeight(.bold)
                }
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
                .accentColor(.white)
                .preferredColorScheme(.dark)
            }
    }
}

#Preview {
    HomePage()
}
