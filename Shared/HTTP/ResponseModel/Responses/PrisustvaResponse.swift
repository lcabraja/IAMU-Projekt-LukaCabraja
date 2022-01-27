//
//  PrisustvaResponse.swift
//  Infoeduka
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let prisustvaResponseWelcome = try? newJSONDecoder().decode(PrisustvaResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - PrisustvaResponseWelcome
struct PrisustvaResponseWelcome: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .prisustva
    let data: [PrisustvaResponseDatum]
    
    func flatten() -> [PrisustvaResponsePredmeti] {
        var _subjects = Set<PrisustvaResponsePredmeti>()
        for semester in data {
            for year in semester.godine {
                for subject in year.predmeti {
                    _subjects.insert(subject)
                }
            }
        }
        return Array(_subjects)
    }
    
//    func findByName(_ className: String) -> PrisustvaResponsePredmeti? {
//        for semester in data {
//            for year in semester.godine {
//                for subject in year.predmeti {
//                    if "\(subject.predmet) (\(subject.sifra))" == className {
//                        return subject
//                    }
//                }
//            }
//        }
//        return nil
//    }
}

// MARK: - PrisustvaResponseDatum
struct PrisustvaResponseDatum: Codable {
    let akademskaGodina, semestar: String
    let godine: [PrisustvaResponseGodine]
}

// MARK: - PrisustvaResponseGodine
struct PrisustvaResponseGodine: Codable {
    let studij, godina, smjer, nacin: String
    let grupa: String
    let predmeti: [PrisustvaResponsePredmeti]
}

// MARK: - PrisustvaResponsePredmeti
struct PrisustvaResponsePredmeti: Codable, Hashable {
    static func == (lhs: PrisustvaResponsePredmeti, rhs: PrisustvaResponsePredmeti) -> Bool {
        lhs.idPredmet == rhs.idPredmet
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(idPredmet)
        hasher.combine(sifra)
    }
    
    let idPredmet: Int
    let predmet, sifra: String
    let ects: Int
    let potpis: Bool
    let potpisDatum: String?
    let ocjena: PrisustvaResponseOcjena
    let ocjenaOpisno: PrisustvaResponseOcjenaOpisno
    let ocjenaDatum: String?
    let polozenBezOcjene, polozenBezOcjeneKolokviran, priznat, priznatCertifikat: Bool
    let dodatno: PrisustvaResponseDodatno
}

// MARK: - PrisustvaResponseDodatno
struct PrisustvaResponseDodatno: Codable {
    let prisustva: PrisustvaResponsePrisustva
}

// MARK: - PrisustvaResponsePrisustva
struct PrisustvaResponsePrisustva: Codable {
    let bodoviDefinirani: Int
    let bodoviOsvojeni: Double
    let imaPravoNaPotpis: Bool
    let predavanja, vjezbe: PrisustvaResponsePredavanja
}

// MARK: - PrisustvaResponsePredavanja
struct PrisustvaResponsePredavanja: Codable {
    let brojSatiDolazak: Double
    let brojSatiOnline, brojSatiIspricnice, brojSatiDefiniranih: Int
    let imaDefiniraneSatnice: Bool
    let postotakOdradjeno: Double
    let zadovoljeno: Bool
    let pojedineSatnice: [PrisustvaResponsePojedineSatnice]
}

// MARK: - PrisustvaResponsePojedineSatnice
struct PrisustvaResponsePojedineSatnice: Codable {
    let datum: String
    let vrijeme: PrisustvaResponseVrijeme
    let termin: PrisustvaResponseTermin
    let odradjena: Bool
    let brojSatiDefiniranih: Int
    let brojSatiDolazak: Double
    let brojSatiOnline, brojSatiIspricnice: Int
}

enum PrisustvaResponseTermin: String, Codable {
    case the08000930 = "08:00-09:30"
    case the08151030 = "08:15-10:30"
    case the08151115 = "08:15-11:15"
    case the08301000 = "08:30-10:00"
    case the09001200 = "09:00-12:00"
    case the09151215 = "09:15-12:15"
    case the09451115 = "09:45-11:15"
    case the10451300 = "10:45-13:00"
    case the11301300 = "11:30-13:00"
    case the13001600 = "13:00-16:00"
    case the13151400 = "13:15-14:00"
    case the13151445 = "13:15-14:45"
    case the14001445 = "14:00-14:45"
    case the14001530 = "14:00-15:30"
    case the14451615 = "14:45-16:15"
    case the15001545 = "15:00-15:45"
    case the15001630 = "15:00-16:30"
    case the16001730 = "16:00-17:30"
    case the16001900 = "16:00-19:00"
    case the16151745 = "16:15-17:45"
    case the16301800 = "16:30-18:00"
    case the17001830 = "17:00-18:30"
    case the18002100 = "18:00-21:00"
    case the18452015 = "18:45-20:15"
    case the20302200 = "20:30-22:00"
}

enum PrisustvaResponseVrijeme: String, Codable {
    case the0800 = "08:00"
    case the0815 = "08:15"
    case the0830 = "08:30"
    case the0900 = "09:00"
    case the0915 = "09:15"
    case the0945 = "09:45"
    case the1045 = "10:45"
    case the1130 = "11:30"
    case the1300 = "13:00"
    case the1315 = "13:15"
    case the1400 = "14:00"
    case the1445 = "14:45"
    case the1500 = "15:00"
    case the1600 = "16:00"
    case the1615 = "16:15"
    case the1630 = "16:30"
    case the1700 = "17:00"
    case the1800 = "18:00"
    case the1845 = "18:45"
    case the2030 = "20:30"
}

enum PrisustvaResponseOcjena: Codable {
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
        throw DecodingError.typeMismatch(PrisustvaResponseOcjena.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for PrisustvaResponseOcjena"))
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

enum PrisustvaResponseOcjenaOpisno: String, Codable {
    case izvrstan5 = "izvrstan (5)"
    case vrloDobar4 = "vrlo dobar (4)"
    case dobar3 = "dobar (3)"
    case dovoljan2 = "dovoljan (2)"
    case empty = ""
}
