//
//  MovieCard.swift
//  Movier
//
//  Created by Min Nageh on 18/01/2024.
//

import SwiftUI

struct MovieCard: View {
    let movie:Movie
    let imageUrl:URL
    var body: some View {
        MovieImage(imageUrl: imageUrl, frameWidth: imageWidth, framHeight: ImageHeight)
    }
}
extension MovieCard{
    var imageWidth:CGFloat{
        screenWidth * Constants.MOVIE_CARD_WIDHT_PRECENT
    }
    var ImageHeight:CGFloat{
        screenHeight * Constants.MOVEI_CARD_HEIGHT_PERCENT
    }
}

#Preview {
    MovieCard(movie: DeveloperPreview.shared.movie, imageUrl: DeveloperPreview.shared.url!)
}
