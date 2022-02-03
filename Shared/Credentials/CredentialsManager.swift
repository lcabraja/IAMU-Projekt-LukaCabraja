//
//  CredentialsManager.swift
//  Infoeduka
//
//  Created by lcabraja on 1/24/22.
//

import SwiftUI
import Foundation

class CredentialsManager: ObservableObject {
    private static let UserDefaultsUsername = "hr.algebra.infoeduka.username"
    
    public static let shared = CredentialsManager()
    
    init() {
        hasCredentials = credentials != nil
    }
    
    var credentials: Credentials? {
        get {
            guard let username: String = UserDefaults.standard.codable(forKey: CredentialsManager.UserDefaultsUsername) else { return nil }
            guard let password = try? KeychainAccess.shared.entry(forKey: username) else { return nil }
            hasCredentials = true
            return Credentials(username: username, password: password)
        }
        set {
            guard
                let username = newValue?.username,
                let password = newValue?.password
            else {
                hasCredentials = false
                return
            }
            guard (try? UserDefaults.standard.setCodable(username, forKey: CredentialsManager.UserDefaultsUsername)) != nil else { return }
            hasCredentials = (try? KeychainAccess.shared.set(entry: password, forKey: username)) != nil
        }
    }
    
//    public typealias subscriber = () -> Void
//
//    func subscribe(subscriber: @escaping subscriber) {
//        self.subscribers.append(subscriber)
//    }
//
//    private var subscribers = [subscriber]()
//
//    private func notifySubscribers() {
//        print("notifying...")
//        for subscriber in self.subscribers {
//            subscriber()
//        }
//    }
    
    var credentialsJSON:  [String: String]? {
        guard
            let username = self.credentials?.username,
            let password = self.credentials?.password
        else { return nil }
        return ["username": username, "password": password]
    }
    
    @Published var hasCredentials: Bool = false
    
    struct Credentials {
        let username: String
        let password: String
    }
}
