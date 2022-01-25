//
//  LoginViewModel.swift
//  Infoeduka
//
//  Created by doss on 1/24/22.
//

import Foundation

class LoginViewModel: ObservableObject  {
    @Published var hasCredentials: Bool
    
    init() {
        hasCredentials = CredentialsManager.hasCredentials
    }
    
    // MARK: - Intents
    
    func setCredentials(_ username: String, _ password: String) {
        CredentialsManager.set(username, password)
        objectWillChange.send()
        hasCredentials = true
    }
}
