//
//  SessionTracker.swift
//  Infoeduka
//
//  Created by lcabraja on 1/24/22.
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
    
    private static var sessionString : String?
    static var lastLogin: LoginResponseWelcome?
    
    static func reauth() {
        let _ = Task {
            sessionString = await getSessionCookie()
        }
    }
    
    private static var authorizing: Bool = false
    
    static func getSessionCookie() async -> String? {
        if !authorizing { authorizing = true } else { return nil }
        guard let credentials = sharedCredentialsManager.credentialsJSON else { return nil }
        let url = InfoedukaHttpEndpoints.login.url
        let credentialsData = try! JSONSerialization.data(withJSONObject: credentials, options: [])
        
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = credentialsData
        
        guard let (data, response) = await HttpRequest.getResponse(request) else { return nil }
        guard let httpResponse = response as? HTTPURLResponse else { return nil }
        guard httpResponse.statusCode == 200 else { sharedCredentialsManager.credentials = nil; return nil }
        guard let cookieHeader = httpResponse.allHeaderFields[AnyHashable("Set-Cookie")] as? String else { return nil }
        let bakedCookie = bakeCookie(cookieHeader)
        let loginResponseWelcome = try? newJSONDecoder().decode(LoginResponseWelcome.self, from: data)
        
        defer {
            sessionString = bakedCookie
            lastLogin = loginResponseWelcome
            authorizing = false
        }
        
        return bakedCookie
    }
    
    private static func bakeCookie(_ rawCookie: String) -> String {
        let startBound2 = String.Index(utf16Offset: 36, in: rawCookie)
        let lastBatch = String(rawCookie[..<startBound2])
        return lastBatch
    }
}
