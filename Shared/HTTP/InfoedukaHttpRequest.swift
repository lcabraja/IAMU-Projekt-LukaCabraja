//
//  InfoedukaHttpRequest.swift
//  Infoeduka
//
//  Created by doss on 1/23/22.
//

import Foundation

struct InfoedukaHttpRequest<ReturnType> where ReturnType: Decodable, ReturnType: InfoedukaUrlGet {
    
    private static func get(_ request: URLRequest) async -> Data? {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 401 {
                SessionTracker.reauth()
                return nil
            }
            return data
        }
        catch { return nil }
    }
    
    static func fetch() async -> ReturnType? {
        guard
            let sessionCookie = await SessionTracker.session
        else { return nil }
        var request = URLRequest(url: ReturnType.self.endpoint.url)
        request.httpMethod = "get"
        request.setValue(sessionCookie, forHTTPHeaderField: "Cookies")
        guard let response = await get(request) else {
            guard let secondResponse = await get(request) else { return nil }
            let welcome = try? newJSONDecoder().decode(ReturnType.self, from: secondResponse)
            return welcome
        }
        let welcome = try? newJSONDecoder().decode(ReturnType.self, from: response)
        return welcome
    }
    
    static func fetch(callback: @escaping (ReturnType?) -> Void) async {
        let model = await fetch()
        DispatchQueue.main.async {
            callback(model)
        }
    }
}
