//
//  KategorijeResponse.swift
//  Infoeduka
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let kategorijeResponseWelcome = try? newJSONDecoder().decode(KategorijeResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - KategorijeResponseWelcome
struct KategorijeResponseWelcome: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .kategorije
    let data: [String]
}
