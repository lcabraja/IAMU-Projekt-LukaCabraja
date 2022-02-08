//
//  PointsResponse.swift
//  Infoeduka
//
//  This file was generated from JSON Schema using quicktype, do not modify it directly.
//  To parse the JSON, add this file to your project and do:
//
//  let pointsResponse = try? newJSONDecoder().decode(PointsResponse.self, from: jsonData)
//

import Foundation

// MARK: - PointsResponse
struct PointsResponse: Codable, InfoedukaUrlGet {
    static let endpoint: InfoedukaHttpEndpoints = .bodovi
    let data: [ResponseSemester]
}

// MARK: - ResponseGrades (data[*].godine[*].predmeti[*].dodatno.bodovi)
struct ResponsePoints: Codable {
    let outcomes: [ResponseOutcome]
    let outcomeCollections: [String: ResponseOutcomeCollection]?
    let criteria: [ResponseCriteria]
    let gradePointScale: [ResponseGradePointScale]
    let definedPoints: Double
    let earnedPoints: Double
    let satisfied: Bool
    
    enum CodingKeys: String, CodingKey {
        case outcomes = "ishodi"
        case outcomeCollections = "ishodiSkupovi"
        case criteria = "kriteriji"
        case gradePointScale = "bodoviOcjene"
        case definedPoints = "bodoviDefinirani"
        case earnedPoints = "bodoviOsvojeni"
        case satisfied = "bodoviZadovoljeno"
    }
    
    init(
        outcomes: [ResponseOutcome],
        outcomeCollections: [String: ResponseOutcomeCollection]?,
        criteria: [ResponseCriteria],
        gradePointScale: [ResponseGradePointScale],
        definedPoints: Double,
        earnedPoints: Double,
        satisfied: Bool
    ) {
        self.outcomes = outcomes
        self.outcomeCollections = outcomeCollections
        self.criteria = criteria
        self.gradePointScale = gradePointScale
        self.definedPoints = definedPoints
        self.earnedPoints = earnedPoints
        self.satisfied = satisfied
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let outcomes = try container.decode([ResponseOutcome].self, forKey: .outcomes)
        let outcomeCollections = try? container.decode([String: ResponseOutcomeCollection]?.self, forKey: .outcomeCollections)
        let criteria = try container.decode([ResponseCriteria].self, forKey: .criteria)
        let gradePointScale = try container.decode([ResponseGradePointScale].self, forKey: .gradePointScale)
        let definedPoints = try container.decode(Double.self, forKey: .definedPoints)
        let earnedPoints = try container.decode(Double.self, forKey: .earnedPoints)
        let satisfied = try container.decode(Bool.self, forKey: .satisfied)
        
        self.init(
            outcomes: outcomes,
            outcomeCollections: outcomeCollections,
            criteria: criteria,
            gradePointScale: gradePointScale,
            definedPoints: definedPoints,
            earnedPoints: earnedPoints,
            satisfied: satisfied
        )
    }
}

// MARK: - ResponseOutcome (data[*].godine[*].predmeti[*].dodatno.bodovi.ishodi)
struct ResponseOutcome: Codable {
    let outcome: String
    let definedPoints: Double
    let earnedPoints: Double
    let outcomeSatisfied: Bool
    let outcomeCollectionIndex: Int
    let outcomeShortName: String
    let outcomeName: String
    let outcomeCollectionSatisfied: Bool
    let firstInCollection: Bool
    let lastInCollection: Bool
    let outcomeCollectionColor: OutcomeCollectionColor
    
    enum CodingKeys: String, CodingKey {
        case outcome = "ishod"
        case definedPoints = "bodoviUkupno"
        case earnedPoints = "bodoviOsvojeno"
        case outcomeSatisfied = "zadovoljeno"
        case outcomeCollectionIndex = "skupIndeks"
        case outcomeShortName = "skupKratkiNaziv"
        case outcomeName = "skupNaziv"
        case outcomeCollectionSatisfied = "skupZadovoljen"
        case firstInCollection = "prviUSkupu"
        case lastInCollection = "zadnjiUSkupu"
        case outcomeCollectionColor = "skupBoja"
    }
}

// MARK: - ResponseOutcomeCollection (data[*].godine[*].predmeti[*].dodatno.ishodiSkupovi)
struct ResponseOutcomeCollection: Codable {
    let index: Int
    let shortName: String
    let name: String
    let satisfied: Bool
    let color: OutcomeCollectionColor
    let definedPoints: Double
    let earnedPoints: Double
    let outcomes: [String: Int]
    
    enum CodingKeys: String, CodingKey {
        case index = "skupIndeks"
        case shortName = "skupKratkiNaziv"
        case name = "skupNaziv"
        case satisfied = "skupZadovoljen"
        case color = "skupBoja"
        case definedPoints = "bodoviUkupno"
        case earnedPoints = "bodoviOsvojeno"
        case outcomes = "ishodi"
    }
}

// MARK: - ResponseCriteria (data[*].godine[*].predmeti[*].dodatno.bodovi.kriteriji)
struct ResponseCriteria: Codable {
    let criteria: String
    let definedPoints: Int
    let earnedPoints : Double?
    let outcomes: [OutcomeCriteria]
    
    enum CodingKeys: String, CodingKey {
        case criteria = "kriterij"
        case definedPoints = "bodoviUkupno"
        case earnedPoints = "bodoviOsvojeni"
        case outcomes = "ishodi"
    }
    
    // MARK: ResponseOutcomeCriteria (data[*].godine[*].predmeti[*].dodatno.bodovi.kriteriji[*].ishodi)
    struct OutcomeCriteria: Codable {
        let outcomeCollectionIndex: Int
        let outcomeCollectionShortName: String
        let outcomeCollectionName: String
        let outcomeCollectionSatisfied: Bool
        let outcomeCollectionColor: OutcomeCollectionColor
        let definedPoints: Int?
        let earnedPoints: Double
        
        enum CodingKeys: String, CodingKey {
            case outcomeCollectionIndex = "skupIndeks"
            case outcomeCollectionShortName = "skupKratkiNaziv"
            case outcomeCollectionName = "skupNaziv"
            case outcomeCollectionSatisfied = "skupZadovoljen"
            case outcomeCollectionColor = "skupBoja"
            case definedPoints = "bodoviUkupno"
            case earnedPoints = "bodoviOsvojeno"
            
        }
    }
}

// MARK: - BodoviResponseBodoviOcjene (data[*].godine.predmeti.dodatno.bodovi.bodoviOcjene)
struct ResponseGradePointScale: Codable {
    let fromInclusive: Double
    let toInclusive: Double
    let grade: ResponseGradeDescription
    
    enum CodingKeys: String, CodingKey {
        case fromInclusive = "bodoviOd"
        case toInclusive = "bodoviDo"
        case grade = "ocjena"
    }
}

struct OutcomeCollectionColor: Codable {
    let r, g, b: Int
    let a: Double
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            let chars = x.split(separator: ",")
            r = Int(chars[0])!
            g = Int(chars[1])!
            b = Int(chars[2])!
            a = Double(chars[3])!
            return
        }
        throw DecodingError.typeMismatch(OutcomeCollectionColor.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for OutcomeCollectionColor"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode("\(r),\(g),\(b),\(a)")
    }
}
