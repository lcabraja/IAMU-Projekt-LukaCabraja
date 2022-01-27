//
//  MaterijaliResponse.swift
//  Infoeduka
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let materijaliResponseWelcome = try? newJSONDecoder().decode(MaterijaliResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - MaterijaliResponseWelcome
struct MaterijaliResponseWelcome: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .materijali
    let data: [MaterijaliResponseDatum]
}

// MARK: - MaterijaliResponseDatum
struct MaterijaliResponseDatum: Codable {
    let akademskaGodina, semestar: String
    let godine: [MaterijaliResponseGodine]
}

// MARK: - MaterijaliResponseGodine
struct MaterijaliResponseGodine: Codable {
    let studij, godina, smjer, nacin: String
    let grupa: String
    let predmeti: [MaterijaliResponsePredmeti]
}

// MARK: - MaterijaliResponsePredmeti
struct MaterijaliResponsePredmeti: Codable {
    let idPredmet: Int
    let predmet, sifra: String
    let ects: Int
    let potpis: Bool
    let potpisDatum: String?
    let ocjena: MaterijaliResponseOcjena
    let ocjenaOpisno: MaterijaliResponseOcjenaOpisno
    let ocjenaDatum: String?
    let polozenBezOcjene, polozenBezOcjeneKolokviran, priznat, priznatCertifikat: Bool
    let dodatno: MaterijaliResponseDodatno
}

// MARK: - MaterijaliResponseDodatno
struct MaterijaliResponseDodatno: Codable {
    let materijali: MaterijaliResponseDodatnoMaterijali
}

// MARK: - MaterijaliResponseDodatnoMaterijali
struct MaterijaliResponseDodatnoMaterijali: Codable {
    let brojMaterijala: Int
    let zadnjaIzmjenaDanUTjednu, zadnjaIzmjenaDatum, zadnjaIzmjenaKorisnik: String?
    let kategorije: [MaterijaliResponseKategorije]
}

// MARK: - MaterijaliResponseKategorije
struct MaterijaliResponseKategorije: Codable {
    let kategorija: MaterijaliResponseKategorija
    let materijali: [MaterijaliResponseMaterijaliElement]
}

enum MaterijaliResponseKategorija: String, Codable {
    case domaćeZadaće = "Domaće zadaće"
    case laboratorijskeVježbe = "Laboratorijske vježbe"
    case ostaliDokumentiKolegija = "Ostali dokumenti kolegija"
    case predavanja = "Predavanja"
    case uputeIPravila = "Upute i pravila"
    case zadaciZaVježbuIRješenja = "Zadaci za vježbu i rješenja"
}

// MARK: - MaterijaliResponseMaterijaliElement
struct MaterijaliResponseMaterijaliElement: Codable {
    let id: Int
    let naziv: String
    let kategorija: MaterijaliResponseKategorija
    let opis, velicina, vrijeme, korisnika: String
    let contentType: String
    let link: String
}

enum MaterijaliResponseOcjena: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(MaterijaliResponseOcjena.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for MaterijaliResponseOcjena"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum MaterijaliResponseOcjenaOpisno: String, Codable {
    case dobar3 = "dobar (3)"
    case dovoljan2 = "dovoljan (2)"
    case empty = ""
    case izvrstan5 = "izvrstan (5)"
    case vrloDobar4 = "vrlo dobar (4)"
}
