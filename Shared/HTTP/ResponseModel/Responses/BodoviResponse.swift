//
//  BodoviResponse.swift
//  Infoeduka
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bodoviResponseWelcome = try? newJSONDecoder().decode(BodoviResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - BodoviResponseWelcome
struct BodoviResponseWelcome: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .bodovi
    let data: [BodoviResponseDatum]
}

// MARK: - BodoviResponseDatum
struct BodoviResponseDatum: Codable {
    let akademskaGodina, semestar: String
    let godine: [BodoviResponseGodine]
}

// MARK: - BodoviResponseGodine
struct BodoviResponseGodine: Codable {
    let studij, godina, smjer, nacin: String
    let grupa: String
    let predmeti: [BodoviResponsePredmeti]
}

// MARK: - BodoviResponsePredmeti
struct BodoviResponsePredmeti: Codable {
    let idPredmet: Int
    let predmet, sifra: String
    let ects: Int
    let potpis: Bool
    let potpisDatum: String?
    let ocjena: BodoviResponseOcjenaUnion
    let ocjenaOpisno: BodoviResponseOcjenaOpisnoEnum
    let ocjenaDatum: String?
    let polozenBezOcjene, polozenBezOcjeneKolokviran, priznat, priznatCertifikat: Bool
    let dodatno: BodoviResponseDodatno
}

// MARK: - BodoviResponseDodatno
struct BodoviResponseDodatno: Codable {
    let bodovi: BodoviResponseBodovi
}

// MARK: - BodoviResponseBodovi
struct BodoviResponseBodovi: Codable {
    let ishodi: [BodoviResponseIshodiElement]
    let ishodiSkupovi: BodoviResponseIshodiSkupoviUnion
    let kriteriji: [BodoviResponseKriteriji]
    let bodoviOcjene: [BodoviResponseBodoviOcjene]
    let bodoviDefinirani: Int
    let bodoviOsvojeni: Double
    let bodoviZadovoljeno: Bool
}

// MARK: - BodoviResponseBodoviOcjene
struct BodoviResponseBodoviOcjene: Codable {
    let bodoviOd: Double
    let bodoviDo: Int
    let ocjena: BodoviResponseOcjenaOpisnoEnum
}

enum BodoviResponseOcjenaOpisnoEnum: String, Codable {
    case dobar3 = "dobar (3)"
    case dovoljan2 = "dovoljan (2)"
    case empty = ""
    case izvrstan5 = "izvrstan (5)"
    case nedovoljan1 = "nedovoljan (1)"
    case vrloDobar4 = "vrlo dobar (4)"
}

// MARK: - BodoviResponseIshodiElement
struct BodoviResponseIshodiElement: Codable {
    let ishod: BodoviResponseIshod
    let bodoviUkupno: Int
    let bodoviOsvojeno: Double
    let zadovoljeno: Bool
    let skupIndeks: Int
    let skupKratkiNaziv: BodoviResponseSkupKratkiNaziv
    let skupNaziv: String
    let skupZadovoljen, prviUSkupu, zadnjiUSkupu: Bool
    let skupBoja: BodoviResponseSkupBoja
}

enum BodoviResponseIshod: String, Codable {
    case i1 = "I1"
    case i2 = "I2"
    case i3 = "I3"
    case i4 = "I4"
    case i5 = "I5"
    case i6 = "I6"
    case i7 = "I7"
    case i8 = "I8"
    case i9 = "I9"
}

enum BodoviResponseSkupBoja: String, Codable {
    case the146199234020 = "146,199,234,0.20"
    case the224113145020 = "224,113,145,0.20"
    case the234146216020 = "234,146,216,0.20"
    case the234181146020 = "234,181,146,0.20"
}

enum BodoviResponseSkupKratkiNaziv: String, Codable {
    case s1 = "S1"
    case s2 = "S2"
    case s3 = "S3"
    case s4 = "S4"
}

enum BodoviResponseIshodiSkupoviUnion: Codable {
    case anythingArray([JSONAny])
    case bodoviResponseIshodiSkupoviClass(BodoviResponseIshodiSkupoviClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([JSONAny].self) {
            self = .anythingArray(x)
            return
        }
        if let x = try? container.decode(BodoviResponseIshodiSkupoviClass.self) {
            self = .bodoviResponseIshodiSkupoviClass(x)
            return
        }
        throw DecodingError.typeMismatch(BodoviResponseIshodiSkupoviUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for BodoviResponseIshodiSkupoviUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .anythingArray(let x):
            try container.encode(x)
        case .bodoviResponseIshodiSkupoviClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - BodoviResponseIshodiSkupoviClass
struct BodoviResponseIshodiSkupoviClass: Codable {
    let s1: BodoviResponseS1
    let s2: BodoviResponseS2
    let s3: BodoviResponseS3?
    let s4: BodoviResponseS4?

    enum CodingKeys: String, CodingKey {
        case s1 = "S1"
        case s2 = "S2"
        case s3 = "S3"
        case s4 = "S4"
    }
}

// MARK: - BodoviResponseS1
struct BodoviResponseS1: Codable {
    let skupIndeks: Int
    let skupKratkiNaziv: BodoviResponseSkupKratkiNaziv
    let skupNaziv: String
    let skupZadovoljen: Bool
    let skupBoja: BodoviResponseSkupBoja
    let bodoviUkupno: Int?
    let bodoviOsvojeno: Double
    let ishodi: BodoviResponseS1Ishodi?
    let ishod: BodoviResponseIshod?
    let ispravljenKasnije: Bool?
}

// MARK: - BodoviResponseS1Ishodi
struct BodoviResponseS1Ishodi: Codable {
    let i1: Int
    let i2, i3, i4: Int?

    enum CodingKeys: String, CodingKey {
        case i1 = "I1"
        case i2 = "I2"
        case i3 = "I3"
        case i4 = "I4"
    }
}

// MARK: - BodoviResponseS2
struct BodoviResponseS2: Codable {
    let skupIndeks: Int
    let skupKratkiNaziv: BodoviResponseSkupKratkiNaziv
    let skupNaziv: String
    let skupZadovoljen: Bool
    let skupBoja: BodoviResponseSkupBoja
    let bodoviUkupno: Int
    let bodoviOsvojeno: Double
    let ishodi: BodoviResponseS2Ishodi
}

// MARK: - BodoviResponseS2Ishodi
struct BodoviResponseS2Ishodi: Codable {
    let i3, i4, i5, i6: Int?
    let i7, i8, i2: Int?

    enum CodingKeys: String, CodingKey {
        case i3 = "I3"
        case i4 = "I4"
        case i5 = "I5"
        case i6 = "I6"
        case i7 = "I7"
        case i8 = "I8"
        case i2 = "I2"
    }
}

// MARK: - BodoviResponseS3
struct BodoviResponseS3: Codable {
    let skupIndeks: Int
    let skupKratkiNaziv: BodoviResponseSkupKratkiNaziv
    let skupNaziv: String
    let skupZadovoljen: Bool
    let skupBoja: BodoviResponseSkupBoja
    let bodoviUkupno: Int
    let bodoviOsvojeno: Double
    let ishodi: BodoviResponseS3Ishodi
}

// MARK: - BodoviResponseS3Ishodi
struct BodoviResponseS3Ishodi: Codable {
    let i5, i6, i7, i4: Int?
    let i8: Int?

    enum CodingKeys: String, CodingKey {
        case i5 = "I5"
        case i6 = "I6"
        case i7 = "I7"
        case i4 = "I4"
        case i8 = "I8"
    }
}

// MARK: - BodoviResponseS4
struct BodoviResponseS4: Codable {
    let skupIndeks: Int
    let skupKratkiNaziv: BodoviResponseSkupKratkiNaziv
    let skupNaziv: String
    let skupZadovoljen: Bool
    let skupBoja: BodoviResponseSkupBoja
    let bodoviUkupno: Int
    let bodoviOsvojeno: Double
    let ishodi: BodoviResponseS4Ishodi
}

// MARK: - BodoviResponseS4Ishodi
struct BodoviResponseS4Ishodi: Codable {
    let i8, i9, i6, i7: Int?

    enum CodingKeys: String, CodingKey {
        case i8 = "I8"
        case i9 = "I9"
        case i6 = "I6"
        case i7 = "I7"
    }
}

// MARK: - BodoviResponseKriteriji
struct BodoviResponseKriteriji: Codable {
    let kriterij: String
    let bodoviUkupno: Int
    let bodoviOsvojeni: Double?
    let ishodi: [BodoviResponseS1]
}

enum BodoviResponseOcjenaUnion: Codable {
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
        throw DecodingError.typeMismatch(BodoviResponseOcjenaUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for BodoviResponseOcjenaUnion"))
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
