//
//  ImageGridShimmer.swift
//  Movier
//
//  Created by Min Nageh on 18/01/2024.
//

import SwiftUI

struct ImageGridShimmer: View {
    var frameWidth:CGFloat
    var framHeight:CGFloat
    var cornerRadius:CGFloat
    @State var show = false
    
    var body: some View {
        Color.white.opacity(0.5)
            .frame(width: frameWidth,height: framHeight)
            .cornerRadius(cornerRadius)
        Color.gray.opacity(0.8)
            .frame(width: frameWidth,height: framHeight)
            .cornerRadius(cornerRadius)
            .mask {
                Rectangle()
                    .fill(
                        LinearGradient(colors: [.gray,.white.opacity(0.5)], startPoint: .bottomLeading, endPoint:.topTrailing)
                    )
                    .rotationEffect(.degrees(90.0))
                    .offset(x:self.show ? screenWidth*0.5  : -screenWidth*0.5 )
        
            }
            .onAppear{
                withAnimation(Animation.default.speed(0.9).delay(0).repeatForever(autoreverses: true)){
                    self.show.toggle()
                }
            }
    }
        
}

#Preview {
    ImageGridShimmer(frameWidth: 150.0, framHeight: 150.0,cornerRadius: 16.0)
}
