//
//  SplashScreen.swift
//  Movier
//
//  Created by Min Nageh on 20/01/2024.
//

import SwiftUI

struct SplashScreen: View {
    @Binding var isPresented :Bool
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    @State private var imageOpacity = 1.0
    @State private var screenOpacity = 1.0
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            ZStack{
                Image("splashImage")
                    .resizable()
                    .scaledToFit()
                    .background(.clear)
            }.scaleEffect(scale)
        }
        .opacity(screenOpacity)
        .onAppear{
            withAnimation(.easeInOut(duration: 1.5)) {
                scale = CGSize(width: 1, height: 1)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                withAnimation(.easeIn(duration: 0.5)) {
                    scale = CGSize(width: 80, height: 80)
                    screenOpacity = 0
                    isPresented = false
                }
            }
        }
    }
    
}

#Preview {
    SplashScreen(isPresented: .constant(true))
}
