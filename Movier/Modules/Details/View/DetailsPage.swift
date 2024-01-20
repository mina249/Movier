//
//  DetailsPage.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import SwiftUI

struct DetailsPage: View {
    var detailsVM = DetailsViewModel()
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                header
                RatingView(rating: detailsVM.selectedMovie?.rating ?? 0.0)
                    .padding(EdgeInsets(top:ratingTopPadding , leading: ratingLeadingPading, bottom: 0, trailing: 0))
                VStack{
                    HStack{
                        Image("calenderIcon")
                        Text("|")
                        Text(detailsVM.selectedMovie?.releaseDate ?? "Unknown Title")
                    }
                }
                .padding(EdgeInsets(top:dateTopPadding, leading: dateLeadingPadding , bottom: 0, trailing: 0))
                movieOverView
            }
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            Spacer()
        }.accentColor(.white)
    }
}

extension DetailsPage{
    var headrXOffeset:Double{
        screenWidth - (screenWidth * 1.3)
    }
    var headerYOffset:Double{
        screenHeight*0.19
    }
    var ratingTopPadding:Double{
        screenHeight - (screenHeight * 1.0)
    }
    var ratingLeadingPading:Double{
        screenWidth * 0.8
    }
    var dateTopPadding:Double{
        screenHeight - (screenHeight * 1.09)
    }
    var dateLeadingPadding:Double{
        screenWidth * 0.38
    }
    /*var detailsVM:DetailsViewModel{
        coOrdinator.deatilsVM
    }*/
}

extension DetailsPage{
    var header:some View{
        VStack(alignment:.leading){
            //Image("backIcon")
            ZStack(){
                MovieImage(imageUrl:detailsVM.getMoviePosterUrl(imageSize: .original, detailsVM.selectedMovie?.imagePath ?? ""), imageType: .cover,movie: detailsVM.selectedMovie ?? DeveloperPreview.shared.movie)
                
                MovieImage(imageUrl: detailsVM.getMoviePosterUrl(imageSize: .w185, detailsVM.selectedMovie?.moviePoster ?? ""),imageType: .poster,movie: detailsVM.selectedMovie ?? DeveloperPreview.shared.movie)
                    .padding(.leading,15)
                    .padding(.trailing)
                    .offset(x:headrXOffeset,y:headerYOffset)
            }
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Text(detailsVM.selectedMovie?.title ?? " movie title")
                    .font(.headline)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding(.leading)
                    //.truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                   // .minimumScaleFactor(0.5)
                    
                    
            }
            
            .padding(.leading,screenWidth * 0.35)
            .padding(.top,20)
        }
    }
}

extension DetailsPage{
    var movieOverView: some View{
        VStack{
            ZStack{
                Text("Movie Overview")
                    .font(.title3)
                RoundedRectangle(cornerRadius: 10)
                    .offset(y:20)
                    .frame(width:100,height:5)
                    .background(.clear)
            }
            ScrollView{
                Text(detailsVM.selectedMovie?.overview ?? "No details for this movie")
                    .padding()
            }
        }.padding(.top,screenHeight * 0.05)
    }
    
}

#Preview {
    DetailsPage()
}
