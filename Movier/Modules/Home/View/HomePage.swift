//
//  HomePage.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import SwiftUI

struct HomePage: View {
    @StateObject var homeVM = HomeViewModel()
    var body: some View {
            LazyVStack(alignment: .leading){
                Text("Welcome To Movier")
                    .padding()
                    .fontWeight(.bold)
            }
            HStack{
                ForEach(EndPoint.allCases, id: \.self){ endPoint in
                    SortingCard(endPoint: endPoint, selectedSortType: $homeVM.selectedSortType)
                        .onTapGesture {
                        homeVM.selectedSortType = endPoint
                        homeVM.resetMoviesList()
                        homeVM.updateMoviesListWithNextPage()
                    }
                }.padding([.trailing,.leading])
            
            }.padding(.bottom,5)
        
        ScrollView(showsIndicators: false){
         /*   GeometryReader { geometry in
                            Text("")
                                .frame(width:0, height: 0)
                                .onAppear(perform: {
                                
                                })
                                .onChange(of: geometry.frame(in: .global).minY) { oldValue, newValue in
                                    if(newValue > oldValue){
                                        opacity = 0.8
                                    }else{
                                        opacity = 0
                                    }
                                    
                                }
                        }*/
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())],spacing: 20){
                ForEach(homeVM.movies){ movie in
                    MovieCard(movie: movie, imageUrl: homeVM.getMoviePosterUrl(imageSize: .w185, movie.moviePoster))
                        .onAppear{
                            if homeVM.isLastMovie(movie){
                                homeVM.updateMoviesListWithNextPage()
                            }
                        }
                }
            }
            .onAppear{
                homeVM.updateMoviesListWithNextPage()
            }
        }.alert(isPresented: $homeVM.hasError, error: homeVM.networkError, actions: {

        })
        
        .preferredColorScheme(.dark)
    }
    
}

#Preview {
    HomePage()
}
