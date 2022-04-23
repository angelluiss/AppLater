//
//  ceibaAppApp.swift
//  Shared
//
//  Created by AR on 22/4/22.
//

import SwiftUI

@main
struct ceibaAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView( card: Card.example)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
