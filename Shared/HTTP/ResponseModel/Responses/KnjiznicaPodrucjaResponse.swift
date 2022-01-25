//
//  KnjiznicaPodrucja.swift
//  Infoeduka
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let knjiznicaPodrucjaResponseWelcome = try? newJSONDecoder().decode(KnjiznicaPodrucjaResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - KnjiznicaPodrucjaResponseWelcome
struct KnjiznicaPodrucjaResponseWelcome: Codable, HasInfoedukaURL {
    static let endpoint: InfoedukaHttpEndpoints = .knjiznicaPodrucja
    let data: [KnjiznicaPodrucjaResponseDatum]
}

// MARK: - KnjiznicaPodrucjaResponseDatum
struct KnjiznicaPodrucjaResponseDatum: Codable {
    let id: Int
    let podrucje: String
}
