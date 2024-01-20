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
        MovieImage(imageUrl: imageUrl,imageType:.poster,movie:movie)
    }
}


#Preview {
    MovieCard(movie: DeveloperPreview.shared.movie, imageUrl: DeveloperPreview.shared.url!)
}
