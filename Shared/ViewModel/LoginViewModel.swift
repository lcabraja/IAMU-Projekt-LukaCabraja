//
//  LoginViewModel.swift
//  Infoeduka
//
//  Created by lcabraja on 1/24/22.
//

import Foundation

struct LoginViewModel  { 
    
    // MARK: - Intents
    
    func setCredentials(_ username: String, _ password: String) {
        sharedCredentialsManager.credentials = CredentialsManager.Credentials(username: username, password: password)
    }
}
