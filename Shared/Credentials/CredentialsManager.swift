//
//  CredentialsManager.swift
//  Infoeduka
//
//  Created by doss on 1/24/22.
//

import Foundation

let sharedCredentialsManager = CredentialsManager()

class CredentialsManager: ObservableObject {
    @Published var credentials: (username: String, password: String)? {
        didSet {
            notifySubscribers()
        }
    }
    
    public typealias subscriber = () -> Void
    
    func subscribe(subscriber: @escaping subscriber) {
        self.subscribers.append(subscriber)
    }
    
    private var subscribers = [subscriber]()
    
    private func notifySubscribers() {
        for subscriber in self.subscribers {
            subscriber()
        }
    }
    
    var credentialsJSON:  [String: String]? {
        guard
            let username = self.credentials?.username,
            let password = self.credentials?.password
        else { return nil }
        return ["username": username, "password": password]
    }
    
    var hasCredentials: Bool {
        return credentials != nil
    }
}
