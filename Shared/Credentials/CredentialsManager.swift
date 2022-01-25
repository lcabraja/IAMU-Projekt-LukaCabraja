//
//  CredentialsManager.swift
//  Infoeduka
//
//  Created by doss on 1/24/22.
//

import Foundation

struct CredentialsManager {
    static var username: String?
    static var password: String?
    
    static func set(_ username: String, _ password: String) {
        CredentialsManager.username = username
        CredentialsManager.password = password
        //SessionTracker.reauth()
    }
    
    static var credentials:  [String: String]? {
        guard
            let username = CredentialsManager.username,
            let password = CredentialsManager.password
        else { return nil }
        return ["username": username, "password": password]
    }
    
    static var hasCredentials: Bool {
        return credentials != nil
    }
}
