//
//  GrupeResponse.swift
//  Infoeduka
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let grupeResponseWelcome = try? newJSONDecoder().decode(GrupeResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - GrupeResponseWelcome
struct GrupeResponseWelcome: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .grupe
    let data: [GrupeResponseDatum]
}

// MARK: - GrupeResponseDatum
struct GrupeResponseDatum: Codable {
    let idGrupa: Int
    let grupa: String
}
