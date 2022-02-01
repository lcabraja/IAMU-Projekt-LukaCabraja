//
//  SecureStore.swift
//  Infoeduka (iOS)
//
//  Created by doss on 1/31/22.
//

import Foundation
import Security

enum KeychainError: Error {
    case invalidContent
    case failiure(OSStatus)
}

class KeychainAccess {
    static let shared = KeychainAccess()
    
    private func setupQueryDictionary(forKey key: String) throws -> [CFString: Any] {
        guard let keyData = key.data(using: .utf8) else {
            print("Error! Could not convert the key to the expected format")
            throw KeychainError.invalidContent
        }
        
        let queryDictionary: [CFString: Any] = [kSecClass: kSecClassGenericPassword, kSecAttrAccount: keyData]
        return queryDictionary
    }
    
    func set(entry: String, forKey key: String) throws {
        guard !entry.isEmpty && !key.isEmpty else {
            print("Can't add an empty string to the keychain")
            throw KeychainError.invalidContent
        }
        
        try removeEntry(forKey: key)
        
        var queryDictionary = try setupQueryDictionary(forKey: key)
        queryDictionary[kSecValueData] = entry.data(using: .utf8)
        
        let status = SecItemAdd(queryDictionary as CFDictionary, nil)
        guard status == errSecSuccess else {
//            print(SecCopyErrorMessageString(status, nil)!)
            throw KeychainError.failiure(status)
        }
    }
    
    func entry(forKey key: String) throws -> String? {
        guard !key.isEmpty else {
            print("Key must be valid")
            throw KeychainError.invalidContent
        }
        var queryDictionary = try setupQueryDictionary(forKey: key)
        queryDictionary[kSecReturnData] = kCFBooleanTrue
        queryDictionary[kSecMatchLimit] = kSecMatchLimitOne
        
        var data: AnyObject?
        
        let status = SecItemCopyMatching(queryDictionary as CFDictionary, &data)
        guard status == errSecSuccess else {
//            print(SecCopyErrorMessageString(status, nil)!)
            throw KeychainError.failiure(status)
        }
        
        guard let itemData = data as? Data, let result = String(data: itemData, encoding: .utf8) else {
            return nil
        }
        return result
    }
    
    func removeEntry(forKey key: String) throws {
        guard !key.isEmpty else {
            print("Key must be valid")
            throw KeychainError.invalidContent
        }
        
        let queryDictionary = try setupQueryDictionary(forKey: key)
        SecItemDelete(queryDictionary as CFDictionary)
//        let status = SecItemDelete(queryDictionary as CFDictionary)
//        guard status == errSecSuccess else {
//            print(SecCopyErrorMessageString(status, nil)!)
//            return
//        }
    }
}
