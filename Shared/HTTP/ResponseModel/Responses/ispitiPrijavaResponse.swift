//
//  ispitiPrijava.swift
//  Infoeduka
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ispitiPrijavaResponseWelcome = try? newJSONDecoder().decode(IspitiPrijavaResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - IspitiPrijavaResponseWelcome
struct IspitiPrijavaResponseWelcome: Codable, HasInfoedukaURL {
    static let endpoint: InfoedukaHttpEndpoints = .ispitiPrijava
    let data: [IspitiPrijavaResponseDatum]
}

// MARK: - IspitiPrijavaResponseDatum
struct IspitiPrijavaResponseDatum: Codable {
    let predmet: String
    let brojPrijava: Int
    let detalji: [IspitiPrijavaResponseDetalji]
}

// MARK: - IspitiPrijavaResponseDetalji
struct IspitiPrijavaResponseDetalji: Codable {
    let idRok: Int
    let tipRoka: String
    let idPredmet: Int
    let dvorana, nastavnik: String
    let potpis: Bool
    let brojPrijava: Int
    let zaPrijavu: Bool
    let rokDatum, rokVrijeme, prijavaDatum, prijavaVrijeme: String
    let odjavaDatum, odjavaVrijeme: String
}
