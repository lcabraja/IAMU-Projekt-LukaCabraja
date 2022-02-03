//
//  UserDefaults.swift
//  Infoeduka (iOS)
//
//  Created by lcabraja on 2/1/22.
//

import Foundation

enum UserDefaultsError: Error {
    case unwritable
}

extension UserDefaults {
    func setCodable<T: Codable>(_ value: T, forKey key: String) throws {
        guard let data = try? newJSONEncoder().encode(value) else {
            throw UserDefaultsError.unwritable
        }
        self.set(data, forKey: key)
    }
    
    func codable<T: Codable>(forKey key: String) -> T? {
        guard let data = self.data(forKey: key) else {
            return nil
        }
        return try? newJSONDecoder().decode(T.self, from: data)
    }
}
