//
//  InfoedukaApp.swift
//  Shared
//
//  Created by lcabraja on 1/23/22.
//

import SwiftUI

@main
struct InfoedukaApp: App {
    
    @StateObject var model = LaunchViewModel()
    
    var body: some Scene {
        WindowGroup {
            if !CredentialsManager.shared.hasCredentials {
                LoginView().task {
                    try? await model.fetchCredentials()
                }
            } else {
                MainView()
            }
        }
    }
}
