//
//  KnjiznicaPodrucjeOdabirResponse.swift
//  Infoeduka
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let knjiznicaPodrucjeOdabirResponseWelcome = try? newJSONDecoder().decode(KnjiznicaPodrucjeOdabirResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - KnjiznicaPodrucjeOdabirResponseWelcome
struct KnjiznicaPodrucjeOdabirResponseWelcome: Codable, HasInfoedukaURL {
    static let endpoint: InfoedukaHttpEndpoints = .knjiznicaPodrucjaOdabir
    let data: [KnjiznicaPodrucjeOdabirResponseDatum]
}

// MARK: - KnjiznicaPodrucjeOdabirResponseDatum
struct KnjiznicaPodrucjeOdabirResponseDatum: Codable {
    let naslov, isbn: String
    let godina: Int
    let izdavac, grad: String?
    let autori: String
    let jezik: KnjiznicaPodrucjeOdabirResponseJezik
    let id: Int
}

enum KnjiznicaPodrucjeOdabirResponseJezik: String, Codable {
    case de = "de"
    case empty = ""
    case en = "en"
    case hr = "hr"
}
