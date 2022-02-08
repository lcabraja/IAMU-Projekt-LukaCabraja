//
//  SubjectsResponse.swift
//  Infoeduka
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let subjectsResponse = try? newJSONDecoder().decode(SubjectsResponse.self, from: jsonData)
//

import Foundation

// MARK: - SubjectsResponse (.)
struct SubjectsResponse: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .predmeti
    var data: [ResponseSemester]
    
    mutating func merge(points: PointsResponse) {
        for (index1, _) in self.data.enumerated() {
            for (index2, _) in self.data[index1].years.enumerated() {
                for (index3, _) in self.data[index1].years[index2].subjects.enumerated() {
                    // TODO: this is horrible, too bad!
                    self.data[index1].years[index2].subjects[index3].additionalData.points = points.data[index1].years[index2].subjects[index3].additionalData.points
                }
            }
        }
    }
    
    mutating func merge(supportingMaterial: SupportingMaterialResponse) {
        for (index1, _) in self.data.enumerated() {
            for (index2, _) in self.data[index1].years.enumerated() {
                for (index3, _) in self.data[index1].years[index2].subjects.enumerated() {
                    // TODO: this is horrible, too bad!
                    self.data[index1].years[index2].subjects[index3].additionalData.supportingMaterial = supportingMaterial.data[index1].years[index2].subjects[index3].additionalData.supportingMaterial
                }
            }
        }
    }
    
    mutating func merge(attendance: AttendanceResponse) {
        for (index1, _) in self.data.enumerated() {
            for (index2, _) in self.data[index1].years.enumerated() {
                for (index3, _) in self.data[index1].years[index2].subjects.enumerated() {
                    // TODO: this is horrible, too bad!
                    self.data[index1].years[index2].subjects[index3].additionalData.attendance = attendance.data[index1].years[index2].subjects[index3].additionalData.attendance
                }
            }
        }
    }
}

// MARK: - ResponseSemester (data)
struct ResponseSemester: Hashable, Codable {
    let academicYear, semester: String
    var years: [ResponseYears]
    
    enum CodingKeys: String, CodingKey {
        case academicYear = "akademskaGodina"
        case semester = "semestar"
        case years = "godine"
    }
    
    static func == (lhs: ResponseSemester, rhs: ResponseSemester) -> Bool {
        lhs.semester == rhs.semester && lhs.academicYear == rhs.academicYear
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(academicYear)
        hasher.combine(semester)
    }
}

// MARK: - ResponseYears (data[*].godine)
struct ResponseYears: Codable {
    let study, year, program, regular: String
    let group: String
    var subjects: [ResponseSubject]
    
    enum CodingKeys: String, CodingKey {
        case study = "studij"
        case year = "godina"
        case program = "smjer"
        case regular = "nacin"
        case group = "grupa"
        case subjects = "predmeti"
    }
}

// MARK: - ResponseSubject (data[*].godine[*].predmeti)
struct ResponseSubject: Codable, Hashable, Equatable {
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
    var additionalData: ResponseAdditionalData
    
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
         additionalData: ResponseAdditionalData) {
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
        let additionalData = (try? container.decode(ResponseAdditionalData.self, forKey: .additionalData)) ?? ResponseAdditionalData()
        
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
    
    static func == (lhs: ResponseSubject, rhs: ResponseSubject) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.code)
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
    var points: ResponsePoints?
    var supportingMaterial: ResponseSupportingMaterial?
    var attendance: ResponseAttendance?
    
    enum CodingKeys: String, CodingKey {
        case points = "bodovi"
        case supportingMaterial = "materijali"
        case attendance = "prisustva"
    }
}
