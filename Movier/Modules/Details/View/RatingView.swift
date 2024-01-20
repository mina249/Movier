//
//  RatingView.swift
//  Movier
//
//  Created by Min Nageh on 19/01/2024.
//

import SwiftUI

struct RatingView: View {
    var rating:Double
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: 1.0)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color.appPink, Color.AppGreen]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
                .frame(width: 70, height: 70)
                .rotationEffect(.degrees(-90))
            
            Text(ratingString)
                .font(.headline)
                .foregroundColor(.white)
                Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .offset(x:27,y:24)
            Image(systemName: "star.fill")
            .foregroundColor(.yellow)
            .offset(x:3.3,y:35)
            Image(systemName: "star.fill")
            .foregroundColor(.yellow)
            .offset(x:-23,y:23)
            
        }
    }
}


extension RatingView{
    var ratingString:String{
        return String(rating)
    }
    
    #Preview {
        RatingView(rating: 5.8)
    }
}
