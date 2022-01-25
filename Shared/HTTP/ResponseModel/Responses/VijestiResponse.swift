//
//  VijestiResponse.swift
//  Infoeduka
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let vijestiResponseWelcome = try? newJSONDecoder().decode(VijestiResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - VijestiResponseWelcome
struct VijestiResponseWelcome: Codable, HasInfoedukaURL {
    static let endpoint: InfoedukaHttpEndpoints = .vijesti
    let data: VijestiResponseData
}

// MARK: - VijestiResponseData
struct VijestiResponseData: Codable {
    let normalan, visoki: [VijestiResponseNormalan]

    enum CodingKeys: String, CodingKey {
        case normalan = "Normalan"
        case visoki = "Visoki"
    }
}

// MARK: - VijestiResponseNormalan
struct VijestiResponseNormalan: Codable {
    let id: Int
    let naslov, tekst, datum, autor: String
    let kategorija: VijestiResponseKategorija
    let prioritet: VijestiResponsePrioritet
    let tagovi: [VijestiResponseTagovi]
    let prilozi: [VijestiResponsePrilozi]
}

enum VijestiResponseKategorija: String, Codable {
    case the3Godina = "3. godina"
}

// MARK: - VijestiResponsePrilozi
struct VijestiResponsePrilozi: Codable {
    let id: Int
    let naziv, opis, velicina, contentType: String
    let link: String
}

enum VijestiResponsePrioritet: String, Codable {
    case normalan = "Normalan"
    case visoki = "Visoki"
}

// MARK: - VijestiResponseTagovi
struct VijestiResponseTagovi: Codable {
    let naziv: String
    let ikona: String
}
