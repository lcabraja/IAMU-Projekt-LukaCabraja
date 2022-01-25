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
            return await getSessionCookie()
        }
    }
    
    static var sessionString : String?
    
    static func reauth() {
        let _ = Task {
            await getSessionCookie()
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
        
        return await withCheckedContinuation { continuation in
            let task = URLSession.shared.dataTask(with: request) { (data1, response, error) in
                if let error = error {
                    print("error:", error)
                    return
                }
                do {
                    guard let response = response as? HTTPURLResponse else { return }
                    guard let cookieHeader = response.allHeaderFields[AnyHashable("Set-Cookie")] as? String else { return }
                    let bakedCookie = bakeCookie(cookieHeader)
                    sessionString = bakedCookie
                    continuation.resume(returning: bakedCookie)
                }
            }
            task.resume()
        }
    }
    
    private static func bakeCookie(_ rawCookie: String) -> String {
        let startBound2 = String.Index(utf16Offset: 36, in: rawCookie)
        let lastBatch = String(rawCookie[..<startBound2])
        return lastBatch
    }
}
