//
//  OsobnoResponse.swift
//  Infoeduka
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let osobnoResponseWelcome = try? newJSONDecoder().decode(OsobnoResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - OsobnoResponseWelcome
struct OsobnoResponseWelcome: Codable, InfoedukaUrlGet {
    static let endpoint = InfoedukaHttpEndpoints.osobno
    let data: OsobnoResponseData
}

// MARK: - OsobnoResponseData
struct OsobnoResponseData: Codable {
    let jmbag, email, telefon, mobitel: String
    let spol: Int
    let oib, imeOca: String
    let slika: String
    let rodjenjeDatum, rodjenjeMjesto, rodjenjeZupanija, rodjenjeDrzava: String
    let narodnost, drzavljanstvo, boravisteAdresa, boravistePostBroj: String
    let boravistePostUred, boravisteMjesto, boravisteDrzava, zavrsenaSkolaNaziv: String
    let zavrsenaSkolaVrsta, zavrsenaSkolaGodina, zavrsenaSkolaMjesto, zavrsenaSkolaZupanija: String
    let zavrsenaSkolaDrzava: String

    enum CodingKeys: String, CodingKey {
        case jmbag, email, telefon, mobitel, spol, oib
        case imeOca = "ime_oca"
        case slika
        case rodjenjeDatum = "rodjenje_datum"
        case rodjenjeMjesto = "rodjenje_mjesto"
        case rodjenjeZupanija = "rodjenje_zupanija"
        case rodjenjeDrzava = "rodjenje_drzava"
        case narodnost, drzavljanstvo
        case boravisteAdresa = "boraviste_adresa"
        case boravistePostBroj = "boraviste_post_broj"
        case boravistePostUred = "boraviste_post_ured"
        case boravisteMjesto = "boraviste_mjesto"
        case boravisteDrzava = "boraviste_drzava"
        case zavrsenaSkolaNaziv = "zavrsena_skola_naziv"
        case zavrsenaSkolaVrsta = "zavrsena_skola_vrsta"
        case zavrsenaSkolaGodina = "zavrsena_skola_godina"
        case zavrsenaSkolaMjesto = "zavrsena_skola_mjesto"
        case zavrsenaSkolaZupanija = "zavrsena_skola_zupanija"
        case zavrsenaSkolaDrzava = "zavrsena_skola_drzava"
    }
}
