//
//  NoNetwork.swift
//  Movier
//
//  Created by Min Nageh on 20/01/2024.
//

import SwiftUI

struct NoNetwork: View {
    var body: some View {
        ContentUnavailableView(
                    "No Internet Connection",
                    systemImage: "wifi.exclamationmark",
                    description: Text("Please check your connection and try again.")
                   
                    
        ).tint(Color.white)
    }
}

#Preview {
    NoNetwork()
}
