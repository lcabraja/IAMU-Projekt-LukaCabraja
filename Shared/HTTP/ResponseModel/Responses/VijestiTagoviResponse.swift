//
//  TagoviResponse.swift
//  Infoeduka
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let vijestiTagoviResponseWelcome = try? newJSONDecoder().decode(VijestiTagoviResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - VijestiTagoviResponseWelcome
struct VijestiTagoviResponseWelcome: Codable, HasInfoedukaURL {
    static let endpoint: InfoedukaHttpEndpoints = .vijestiTagovi
    let data: [TagoviResponseDatum]
}

// MARK: - VijestiTagoviResponseDatum
struct TagoviResponseDatum: Codable {
    let id: Int
    let naziv: String
    let ikona: String
}
