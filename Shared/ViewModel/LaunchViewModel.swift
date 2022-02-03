//
//  LaunchViewModel.swift
//  Infoeduka (iOS)
//
//  Created by lcabraja on 2/2/22.
//

import Foundation

private actor LaunchViewModelStore {
    private var hasCredentials: Bool = false
    
    func load() -> Bool {
        hasCredentials = CredentialsManager.shared.hasCredentials
        return hasCredentials
    }
}

class LaunchViewModel: ObservableObject  {
    @Published var hasCredentials: Bool = false
    @Published var fetching: Bool = false
    private var store = LaunchViewModelStore()
}

extension LaunchViewModel {
    @MainActor
    func fetchCredentials() async throws {
        fetching = true
        defer { fetching = false }
        let credentialsState = await store.load()
        hasCredentials = credentialsState   
    }
}
