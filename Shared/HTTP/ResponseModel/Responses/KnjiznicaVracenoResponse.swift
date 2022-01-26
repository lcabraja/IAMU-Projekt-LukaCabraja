//
//  KnjiznicaVracenoResponse.swift
//  Infoeduka
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let knjiznicaVracenoResponseWelcome = try? newJSONDecoder().decode(KnjiznicaVracenoResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - KnjiznicaVracenoResponseWelcome
struct KnjiznicaVracenoResponseWelcome: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .knjiznicaVraceno
    let data: [KnjiznicaVracenoResponseDatum]
}

// MARK: - KnjiznicaVracenoResponseDatum
struct KnjiznicaVracenoResponseDatum: Codable {
    let naslov, isbn: String
    let godina: Int
    let izdavac, grad, autori, jezik: String
    let vracenoStanje: Int
    let vracenoStanjeNaziv, vracenoVrijeme, inventarniBroj: String
    let posudbaStanje: Int
    let posudbaStanjeNaziv, posudbaVrijeme: String
}
