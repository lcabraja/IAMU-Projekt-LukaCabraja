//
//  MentoriResponse.swift
//  Infoeduka
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let mentoriResponseWelcome = try? newJSONDecoder().decode(MentoriResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - MentoriResponseWelcome
struct MentoriResponseWelcome: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .mentori
    let data: [MentoriResponseDatum]
}

// MARK: - MentoriResponseDatum
struct MentoriResponseDatum: Codable {
    let id: Int
    let nastavnik: String
}
