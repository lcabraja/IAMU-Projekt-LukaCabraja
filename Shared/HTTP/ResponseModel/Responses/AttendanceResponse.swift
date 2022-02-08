//
//  PrisustvaResponse.swift
//  Infoeduka
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let attendanceResponse = try? newJSONDecoder().decode(AttendanceResponse.self, from: jsonData)
//

import Foundation

// MARK: - AttendanceResponse
struct AttendanceResponse: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .prisustva
    let data: [ResponseSemester]
}

// MARK: - PrisustvaResponsePrisustva
struct ResponseAttendance: Codable {
    let pointsDefined: Int
    let pointsEarned: Double
    let signatureRight: Bool
    let lectures,
        labs: ResponseAttendanceGroup
    
    enum CodingKeys: String, CodingKey {
        case pointsDefined = "bodoviDefinirani"
        case pointsEarned = "bodoviOsvojeni"
        case signatureRight = "imaPravoNaPotpis"
        case lectures = "predavanja"
        case labs = "vjezbe"
    }
}

// MARK: - ResponseAttendanceGroup
struct ResponseAttendanceGroup: Codable {
    let eventsAttended: Double
    let eventsOnline,
        eventsExcused,
        eventsDefined: Int
    let hasEvents: Bool
    let percentComplete: Double
    let satisfied: Bool
    let events: [ResponseAttendanceEvents]
    
    enum CodingKeys: String, CodingKey {
        case eventsAttended = "brojSatiDolazak"
        case eventsOnline = "brojSatiOnline"
        case eventsExcused = "brojSatiIspricnice"
        case eventsDefined = "brojSatiDefiniranih"
        case hasEvents = "imaDefiniraneSatnice"
        case percentComplete = "postotakOdradjeno"
        case satisfied = "zadovoljeno"
        case events = "pojedineSatnice"
    }
}

// MARK: - ResponseAttendanceEvents
struct ResponseAttendanceEvents: Codable {
    let date: String
    let time: String
    let timeslot: String
    let happened: Bool
    let eventsDefined: Int
    let eventsAttended: Double
    let eventsOnline,
        eventsExcused: Int
    
    enum CodingKeys: String, CodingKey  {
        case date = "datum"
        case time = "vrijeme"
        case timeslot = "termin"
        case happened = "odradjena"
        case eventsDefined = "brojSatiDefiniranih"
        case eventsAttended = "brojSatiDolazak"
        case eventsOnline = "brojSatiOnline"
        case eventsExcused = "brojSatiIspricnice"
    }
}
