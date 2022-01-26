//
//  KnjiznicaPosudbaResponse.swift
//  Infoeduka
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let knjiznicaPosudbaResponseWelcome = try? newJSONDecoder().decode(KnjiznicaPosudbaResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - KnjiznicaPosudbaResponseWelcome
struct KnjiznicaPosudbaResponseWelcome: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .knjiznicaPosudba
    let data: [KnjiznicaPosudbaResponseDatum]
}

// MARK: - KnjiznicaPosudbaResponseDatum
struct KnjiznicaPosudbaResponseDatum: Codable {
    let naslov, isbn: String
    let godina: Int
    let izdavac, grad, autori, jezik: String
    let inventarniBroj: String
    let posudbaStanje: Int
    let posudbaStanjeNaziv, posudbaVrijeme: String
}
