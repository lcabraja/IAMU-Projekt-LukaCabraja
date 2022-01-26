//
//  IspitiOdjavaResponse.swift
//  Infoeduka
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ispitiOdjavaResponseWelcome = try? newJSONDecoder().decode(IspitiOdjavaResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - IspitiOdjavaResponseWelcome
struct IspitiOdjavaResponseWelcome: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .ispitiOdjava
    let data: [IspitiOdjavaResponseDatum]
}

// MARK: - IspitiOdjavaResponseDatum
struct IspitiOdjavaResponseDatum: Codable {
    let predmet: String
    let brojPrijava: Int
    let detalji: [IspitiOdjavaResponseDetalji]
}

// MARK: - IspitiOdjavaResponseDetalji
struct IspitiOdjavaResponseDetalji: Codable {
    let idRok: Int
    let tipRoka: String
    let idPredmet: Int
    let dvorana, nastavnik: String
    let potpis: Bool
    let brojPrijava: Int
    let zaPrijavu, zaOdjavu: Bool
    let rokDatum, rokVrijeme, prijavaDatum, prijavaVrijeme: String
    let odjavaDatum, odjavaVrijeme, prijavaStudentaDatum, prijavaStudentaVrijeme: String
}
