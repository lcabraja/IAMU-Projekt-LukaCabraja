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

    let development: Bool = true
    var isInDevelopment: Bool {
        if development { do { sleep(2) } }
        return true
    }
    
//    @State var animated:
    
    var body: some Scene {
        WindowGroup {
            if isInDevelopment {
                if !sharedCredentialsManager.hasCredentials {
                    LoginView()
                } else {
                    MainView(model: mainView)
                }
            }
        }
    }
}
