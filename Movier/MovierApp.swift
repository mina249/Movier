//
//  MovierApp.swift
//  Movier
//
//  Created by Min Nageh on 16/01/2024.
//

import SwiftUI

@main
struct MovierApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
