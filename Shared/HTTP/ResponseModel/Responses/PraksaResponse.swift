//
//  PraksaResponse.swift
//  Infoeduka
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let praksaResponseWelcome = try? newJSONDecoder().decode(PraksaResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - PraksaResponseWelcome
struct PraksaResponseWelcome: Codable, HasInfoedukaURL {
    static let endpoint: InfoedukaHttpEndpoints = .praksa
    let data: PraksaResponseData
}

// MARK: - PraksaResponseData
struct PraksaResponseData: Codable {
    let odradjena: Bool
    let nacin, datum: String
}
