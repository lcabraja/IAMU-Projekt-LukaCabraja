//
//  InfoedukaHttpEndpoints.swift
//  Infoeduka
//
//  Created by doss on 1/23/22.
//

import Foundation

enum InfoedukaHttpEndpoints: String, CaseIterable {
    case login = "https://student.racunarstvo.hr/digitalnareferada/api/login"
    case vijestiTagovi = "https://student.racunarstvo.hr/digitalnareferada/api/vijesti/tagovi"
    case kategorije = "https://student.racunarstvo.hr/digitalnareferada/api/vijesti/kategorije"
    case vijesti = "https://student.racunarstvo.hr/digitalnareferada/api/vijesti"
    case tjedni = "https://student.racunarstvo.hr/digitalnareferada/api/student/raspored/tjedni"
    // case kategorija = "https://student.racunarstvo.hr/digitalnareferada/api/kategorija"
    // case ankete = "https://student.racunarstvo.hr/digitalnareferada/api/anketa/aktivne"
    // case burzaOtvorena = "https://student.racunarstvo.hr/digitalnareferada/api/student/burza/otvorena"
    // case burzaPrijava = "https://student.racunarstvo.hr/digitalnareferada/api/student/burza/prijava"
    // case burzaTvrtke = "https://student.racunarstvo.hr/digitalnareferada/api/student/burza/tvrtke"
    case ispitiPrijava = "https://student.racunarstvo.hr/digitalnareferada/api/student/ispiti/prijava"
    case ispitiOdjava = "https://student.racunarstvo.hr/digitalnareferada/api/student/ispiti/odjava"
    // case ispitiPrijavaNa = "https://student.racunarstvo.hr/digitalnareferada/api/student/ispiti/prijava/12345"
    // case ispitiOdjavaSa = "https://student.racunarstvo.hr/digitalnareferada/api/student/ispiti/odjava/12345"
    case knjiznicaPodrucja = "https://student.racunarstvo.hr/digitalnareferada/api/knjiznica/podrucja"
    case knjiznicaPodrucjaOdabir = "https://student.racunarstvo.hr/digitalnareferada/api/knjiznica/knjige/"
    case knjiznicaPosudba = "https://student.racunarstvo.hr/digitalnareferada/api/knjiznica/posudba"
    case knjiznicaVraceno = "https://student.racunarstvo.hr/digitalnareferada/api/knjiznica/vraceno"
    case bodovi = "https://student.racunarstvo.hr/digitalnareferada/api/student/predmeti/?dodatno=bodovi"
    case materijali = "https://student.racunarstvo.hr/digitalnareferada/api/student/predmeti/?dodatno=materijali"
    case prisustva = "https://student.racunarstvo.hr/digitalnareferada/api/student/predmeti/?dodatno=prisustva"
    case grupe = "https://student.racunarstvo.hr/digitalnareferada/api/student/raspored/grupe"
    case praksa = "https://student.racunarstvo.hr/digitalnareferada/api/student/zavrsni/praksa"
    case mentori = "https://student.racunarstvo.hr/digitalnareferada/api/student/zavrsni/mentori"
    // case odabir = "https://student.racunarstvo.hr/digitalnareferada/api/student/zavrsni/odabir"
    
    var url: URL {
        URL(string: self.rawValue)!
    }
}
