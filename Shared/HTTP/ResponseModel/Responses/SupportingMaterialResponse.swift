//
//  SupportingMaterialResponse.swift
//  Infoeduka
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let supportingMaterialResponse = try? newJSONDecoder().decode(SupportingMaterialResponse.self, from: jsonData)
//

import Foundation

// MARK: - SupportingMaterialResponse
struct SupportingMaterialResponse: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .materijali
    let data: [ResponseSemester]
}

// MARK: - MaterijaliResponseDodatnoMaterijali
struct ResponseSupportingMaterial: Codable {
    let numberOfFiles: Int
    let lastChangeDayOfWeek,
        lastChangeDate,
        lastChangeUser: String?
    let categories: [ResponseSupportMaterialCategory]
    
    enum CodingKeys: String, CodingKey {
         case numberOfFiles = "brojMaterijala"
         case lastChangeDayOfWeek = "zadnjaIzmjenaDanUTjednu"
         case lastChangeDate = "zadnjaIzmjenaDatum"
         case lastChangeUser = "zadnjaIzmjenaKorisnik"
         case categories = "kategorije"
    }
}

// MARK: - MaterijaliResponseKategorije
struct ResponseSupportMaterialCategory: Codable {
    let title: String
    let materials: [ResponseSupportItems]
    
    enum CodingKeys: String, CodingKey {
        case title = "kategorija"
        case materials = "materijali"
    }
}

// MARK: - MaterijaliResponseMaterijaliElement
struct ResponseSupportItems: Codable {
    let id: Int
    let name: String
    let category: String
    let description,
        fileSize,
        publishTime,
        publishUser: String
    let contentType: String
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "naziv"
        case category = "kategorija"
        case description = "opis"
        case fileSize = "velicina"
        case publishTime = "vrijeme"
        case publishUser = "korisnika"
        case contentType = "contentType"
        case link = "link"
    }
}
