//
//  SessionTracker.swift
//  Infoeduka
//
//  Created by doss on 1/24/22.
//

import Foundation

struct SessionTracker {
    
    static var session: String? {
        get async {
            if let sessionString = sessionString {
                return sessionString
            }
            return await getSessionCookie()
        }
    }
    
    static var sessionString : String?
    static var lastLogin: LoginResponseWelcome?
    
    static func reauth() {
        let _ = Task {
            sessionString = await getSessionCookie()
        }
    }
    
    static func getSessionCookie() async -> String? {
        guard let credentials = CredentialsManager.credentials else { return nil }
        let url = InfoedukaHttpEndpoints.login.url
        let credentialsData = try! JSONSerialization.data(withJSONObject: credentials, options: [])
        
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = credentialsData
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 401 {
                SessionTracker.reauth()
                return nil
            }
            guard let response = response as? HTTPURLResponse else { return nil }
            guard let cookieHeader = response.allHeaderFields[AnyHashable("Set-Cookie")] as? String else { return nil }
            let bakedCookie = bakeCookie(cookieHeader)
            sessionString = bakedCookie
            
            let loginResponseWelcome = try? newJSONDecoder().decode(LoginResponseWelcome.self, from: data)
            lastLogin = loginResponseWelcome
            
            return bakedCookie
        }
        catch { return nil }
    }
    
    private static func bakeCookie(_ rawCookie: String) -> String {
        let startBound2 = String.Index(utf16Offset: 36, in: rawCookie)
        let lastBatch = String(rawCookie[..<startBound2])
        return lastBatch
    }
}
