//
//  TjedniResponse.swift
//  Infoeduka
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tjedniResponseWelcome = try? newJSONDecoder().decode(TjedniResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - TjedniResponseWelcome
struct TjedniResponseWelcome: Codable, HasInfoedukaURL {
    static let endpoint: InfoedukaHttpEndpoints = .tjedni
    let data: [TjedniResponseDatum]
}

// MARK: - TjedniResponseDatum
struct TjedniResponseDatum: Codable {
    let datum, terminPocetak, terminKraj: String
    let terminTrajanje: Int
    let dvorana, url, nastavnik: String
    let tip: TjedniResponseTip
    let predmet: String
    let onlineNapomena: String?

    enum CodingKeys: String, CodingKey {
        case datum, terminPocetak, terminKraj, terminTrajanje, dvorana, url, nastavnik, tip, predmet
        case onlineNapomena = "online_napomena"
    }
}

enum TjedniResponseTip: String, Codable {
    case ispit = "Ispit"
    case predavanje = "Predavanje"
    case vježbe = "Vježbe"
}
