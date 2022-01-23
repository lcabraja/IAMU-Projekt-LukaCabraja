//
//  InfoedukaApp.swift
//  Shared
//
//  Created by doss on 1/23/22.
//

import SwiftUI

@main
struct InfoedukaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
