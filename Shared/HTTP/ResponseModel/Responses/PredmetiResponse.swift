//
//  PredmetiResponse.swift
//  Infoeduka
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let predmetiResponseWelcome = try? newJSONDecoder().decode(PredmetiResponseWelcome.self, from: jsonData)
//

import Foundation

// MARK: - PredmetiResponseWelcome (.)
struct PredmetiResponseWelcome: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .predmeti
    let data: [ResponseSemester]
}

// MARK: - ResponseSemester (data)
struct ResponseSemester: Codable {
    let academicYear, semester: String
    var years: [ResponseYears]
    
    enum CodingKeys: String, CodingKey {
        case academicYear = "akademskaGodina"
        case semester = "semestar"
        case years = "godine"
    }
}

// MARK: - ResponseYears (data[*].godine)
struct ResponseYears: Codable {
    let studij, godina, smjer, nacin: String
    let grupa: String
    var predmeti: [ResponseSubjects]
}

// MARK: - ResponseSubjects (data[*].godine[*].predmeti)
struct ResponseSubjects: Codable {
    let id: Int
    let subject: String
    let code: String
    let ects: Int
    let signature: Bool
    let signatureDate: String?
    let grade: Int?
    let gradeDescription: ResponseGradeDescription
    let gradeDate: String?
    let passedWithoutGrade: Bool
    let passedWithoutGradeByColloquium: Bool
    let accepted: Bool
    let acceptedCertificate: Bool
    var additionalData: ResponseAdditionalData?
    
    enum CodingKeys: String, CodingKey {
        case id = "idPredmet"
        case subject = "predmet"
        case code = "sifra"
        case ects = "ects"
        case signature = "potpis"
        case signatureDate = "potpisDatum"
        case grade = "ocjena"
        case gradeDescription = "ocjenaOpisno"
        case gradeDate = "ocjenaDatum"
        case passedWithoutGrade = "polozenBezOcjene"
        case passedWithoutGradeByColloquium = "polozenBezOcjeneKolokviran"
        case accepted = "priznat"
        case acceptedCertificate = "priznatCertifikat"
        case additionalData = "dodatno"
    }
    
    init(id: Int,
         subject: String,
         code: String,
         ects: Int,
         signature: Bool,
         signatureDate: String?,
         grade: Int?,
         gradeDescription: ResponseGradeDescription,
         gradeDate: String?,
         passedWithoutGrade: Bool,
         passedWithoutGradeByColloquium: Bool,
         accepted: Bool,
         acceptedCertificate: Bool,
         additionalData: ResponseAdditionalData?) {
        self.id = id
        self.subject = subject
        self.code = code
        self.ects = ects
        self.signature = signature
        self.signatureDate = signatureDate
        self.grade = grade
        self.gradeDescription = gradeDescription
        self.gradeDate = gradeDate
        self.passedWithoutGrade = passedWithoutGrade
        self.passedWithoutGradeByColloquium = passedWithoutGradeByColloquium
        self.accepted = accepted
        self.acceptedCertificate = acceptedCertificate
        self.additionalData = additionalData
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(Int.self, forKey: .id)
        let subject = try container.decode(String.self, forKey: .subject)
        let code = try container.decode(String.self, forKey: .code)
        let ects = try container.decode(Int.self, forKey: .ects)
        let signature = try container.decode(Bool.self, forKey: .signature)
        let signatureDate = try container.decodeIfPresent(String.self, forKey: .signatureDate)
        let grade = try? container.decode(Int.self, forKey: .grade)
        let gradeDescription = try container.decode(ResponseGradeDescription.self, forKey: .gradeDescription)
        let gradeDate = try container.decodeIfPresent(String.self, forKey: .gradeDate)
        let passedWithoutGrade = try container.decode(Bool.self, forKey: .passedWithoutGrade)
        let passedWithoutGradeByColloquium = try container.decode(Bool.self, forKey: .passedWithoutGradeByColloquium)
        let accepted = try container.decode(Bool.self, forKey: .accepted)
        let acceptedCertificate = try container.decode(Bool.self, forKey: .acceptedCertificate)
        let additionalData = try? container.decode(ResponseAdditionalData.self, forKey: .additionalData)
        
        self.init(id: id,
                  subject: subject,
                  code: code,
                  ects: ects,
                  signature: signature,
                  signatureDate: signatureDate,
                  grade: grade,
                  gradeDescription: gradeDescription,
                  gradeDate: gradeDate,
                  passedWithoutGrade: passedWithoutGrade,
                  passedWithoutGradeByColloquium: passedWithoutGradeByColloquium,
                  accepted: accepted,
                  acceptedCertificate: acceptedCertificate,
                  additionalData: additionalData)
    }
}

// MARK: - ResponseGradeDescription (*.ocjenaOpisno)
enum ResponseGradeDescription: String, Codable {
    case empty = ""
    case grade1 = "nedovoljan (1)"
    case grade2 = "dovoljan (2)"
    case grade3 = "dobar (3)"
    case grade4 = "vrlo dobar (4)"
    case grade5 = "izvrstan (5)"
}

// MARK: - ResponseAdditionalData (data[*].godine[*].predmeti[*].dodatno.bodovi)
struct ResponseAdditionalData: Codable {
    var grades: ResponsePoints?
    var supportingMaterial: MaterijaliResponseDodatnoMaterijali?
    var absences: PrisustvaResponsePrisustva?
    
    enum CodingKeys: String, CodingKey {
        case grades = "bodovi"
        case supportingMaterial = "materijali"
        case absences = "prisustva"
    }
}
