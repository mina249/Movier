//
//  MovieImage.swift
//  Movier
//
//  Created by Min Nageh on 18/01/2024.
//

import SwiftUI

struct MovieImage: View {
    var imageUrl:URL
    var imageType:ImageType
    var movie:Movie
    
    var body: some View {
        
        AsyncImage(url: imageUrl){image in
                image
                .resizable()
                .scaledToFill()
        }placeholder: {
            ZStack{
                ImageGridShimmer(frameWidth: frameWidth, framHeight: framHeight, cornerRadius: 16)
                Text(movie.originalTitle)
            }
        }
        .frame(width: frameWidth,height: framHeight)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}
extension MovieImage{
    var frameWidth:CGFloat{
        switch imageType{
        case .poster:
            return screenWidth * imageType.widthPercent
        case.cover:
            return screenWidth  * imageType.widthPercent
        }
    }
    var framHeight:CGFloat{
        switch imageType{
        case .poster:
            return screenHeight * imageType.heightPercent
        case.cover:
            return screenHeight  * imageType.heightPercent
        }
    }
}

#Preview {
    MovieImage(imageUrl: DeveloperPreview.shared.url!,imageType:.poster,movie: DeveloperPreview.shared.movie)
}
