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
    
    let development: Bool = false
    var isInDevelopment: Bool {
        if development { do { sleep(2) } }
        return true
    }
    
    var body: some Scene {
        WindowGroup {
            if isInDevelopment {
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
}
