//
//  LoginViewModel.swift
//  Infoeduka
//
//  Created by lcabraja on 1/24/22.
//

import Foundation

class LoginViewModel: ObservableObject  {
    
    // MARK: - Intents
    
    func setCredentials(_ username: String, _ password: String) {
        CredentialsManager.shared.credentials = CredentialsManager.Credentials(username: username, password: password)
    }
}
