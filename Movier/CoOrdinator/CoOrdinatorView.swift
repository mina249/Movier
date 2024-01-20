//
//  CoOrdinatorView.swift
//  Movier
//
//  Created by Min Nageh on 20/01/2024.
//

import SwiftUI

struct CoOrdinatorView: View {
        @StateObject var coOrdinator = CoOrdinator()
        @State private var isSplashScreenresented = true
    var body: some View {
        
        if isSplashScreenresented{
            SplashScreen(isPresented: $isSplashScreenresented)
        }else{
           HomePage()
        }
        
        /*NavigationStack(path: $coOrdinator.path){
            coOrdinator.buildpage(.home)
                .navigationDestination(for: Pages.self) { page in
                    coOrdinator.buildpage(page)
                }
        }
        .environmentObject(coOrdinator)*/
    }
}

#Preview {
    CoOrdinatorView()
}
