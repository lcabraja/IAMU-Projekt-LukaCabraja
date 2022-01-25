//
//  InfoedukaApp.swift
//  Shared
//
//  Created by doss on 1/23/22.
//

import SwiftUI

@main
struct InfoedukaApp: App {
    @ObservedObject private var login = LoginViewModel()
    @State private var mainView = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            if (!login.hasCredentials) {
                LoginView(model: login, mvm: mainView.updateModel)
            } else {
                MainView(model: mainView)
            }
        }
    }
}
