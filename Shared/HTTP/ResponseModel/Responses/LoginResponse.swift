//
//  LoginResponse.swift
//  Infoeduka
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let loginResponseWelcome = try? newJSONDecoder().decode(LoginResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - LoginResponseWelcome
struct LoginResponseWelcome: Codable {
    static let endpoint: InfoedukaHttpEndpoints = .login
    let data: LoginResponseData
}

// MARK: - LoginResponseData
struct LoginResponseData: Codable {
    let korisnik: String
    let moduli: [String: String]
    let moduliLinkovi: LoginResponseModuliLinkovi
    let kategorijaVijesti, jezik: String
    let dodatno: LoginResponseDodatno
}

// MARK: - LoginResponseDodatno
struct LoginResponseDodatno: Codable {
    let blokadaPotpuna, blokadaDug, duznikPocek: Bool
    let dugIznos, evidentiranDatumDuga: String
    let blokadaPrivola: Bool
    let privolaPocekBrPredracuna, privolaPocekPreostaloDana: Int
    let privolaZatrazenaDatum: String
    let privolaObveznik: [JSONAny]
    let privolaSamSebiObveznik, neispunjeneAnkete: Bool
    let neispunjeneAnketePIN, neispunjeneAnketeURL: String
    let status: LoginResponseStatus
    let statusAktualnogUpisnogLista, napomenaAktualnogUpisnogLista: String
    let zabranaUpisnogListaZbogDugaIliPrivole, blokadaLozinka, neprocitanePoruke: Bool
}

// MARK: - LoginResponseStatus
struct LoginResponseStatus: Codable {
    let grupa, godina, semestar: String
}

// MARK: - LoginResponseModuliLinkovi
struct LoginResponseModuliLinkovi: Codable {
}

