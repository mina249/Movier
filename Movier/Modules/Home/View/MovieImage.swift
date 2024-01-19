//
//  MovieImage.swift
//  Movier
//
//  Created by Min Nageh on 18/01/2024.
//

import SwiftUI

struct MovieImage: View {
    var imageUrl:URL
    var frameWidth:CGFloat
    var framHeight:CGFloat
    
    var body: some View {
        
        AsyncImage(url: imageUrl){image in
                image
                .resizable()
                .scaledToFill()
        }placeholder: {
            ZStack{
                ImageGridShimmer(frameWidth: frameWidth, framHeight: framHeight, cornerRadius: 16)
            }
        }
        .frame(width: frameWidth,height: framHeight)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
}

#Preview {
    MovieImage(imageUrl: DeveloperPreview.shared.url!,frameWidth: 150.0,framHeight: 150.0)
}
