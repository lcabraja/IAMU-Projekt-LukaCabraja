//
//  InfoedukaHttpRequest.swift
//  Infoeduka
//
//  Created by doss on 1/23/22.
//

import Foundation

struct InfoedukaHttpRequest<ReturnType> where ReturnType: Decodable, ReturnType: HasInfoedukaURL {
    
    static func fetch(httpMethod: String = "get") async -> ReturnType? {
        guard
            let sessionCookie = await SessionTracker.session
        else { return nil }
        var request = URLRequest(url: ReturnType.self.endpoint.url)
        request.httpMethod = httpMethod
        request.setValue(sessionCookie, forHTTPHeaderField: "Cookies")
        request.httpShouldHandleCookies = true
        return await withCheckedContinuation { continuation in
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if (error != nil) { return }
                if let response = response {
                    print(response)
                }
                guard
                    let data = data,
                    let utfDataString = String(data: data, encoding: .utf8),
                    let utfData = utfDataString.data(using: .utf8)
                else { return }
                guard
                    let tagoviResponseWelcome = try? newJSONDecoder().decode(ReturnType.self, from: utfData)
                else { return }
                continuation.resume(returning: tagoviResponseWelcome)
            }
            task.resume()
        }
    }
}
