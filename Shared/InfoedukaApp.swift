//
//  InfoedukaApp.swift
//  Shared
//
//  Created by doss on 1/23/22.
//

import SwiftUI

@main
struct InfoedukaApp: App {
    @ObservedObject private var mainView = MainViewModel()

    var body: some Scene {
        WindowGroup {
            if !sharedCredentialsManager.hasCredentials {
                LoginView(mvm: mainView.fetchData)
            } else {
                MainView(model: mainView)
            }
        }
    }
}
