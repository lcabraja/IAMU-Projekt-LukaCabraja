//
//  PreviewLoginResponse.swift
//  Infoeduka
//
//  Created by doss on 2/6/22.
//

import Foundation

extension LoginResponseWelcome {
    static var preview: LoginResponseWelcome {
        return LoginResponseWelcome(
            data: LoginResponseData(
                korisnik: "Cvita Brala",
                moduli: [
                    "aa": "Naslovna",
                    "ab": "Novosti",
                    "ac": "Anketa",
                    "ad": "Burza prakse",
                    "ae": "E-učenje",
                    "af": "Financije",
                    "ag": "Ispiti",
                    "ah": "Knjižnica",
                    "ai": "Ocjene",
                    "aj": "Osobni podaci",
                    "ak": "Poruke",
                    "al": "Postavke sustava",
                    "am": "Predmeti",
                    "an": "Prisustva",
                    "ao": "Raspored",
                    "ap": "Referada",
                    "aq": "Završni rad"
                ],
                moduliLinkovi: LoginResponseModuliLinkovi(),
                kategorijaVijesti: "3. godina",
                jezik: "hr",
                dodatno: LoginResponseDodatno(
                    blokadaPotpuna: false,
                    blokadaDug: false,
                    duznikPocek: false,
                    dugIznos: "0.00",
                    evidentiranDatumDuga: "",
                    blokadaPrivola: false,
                    privolaPocekBrPredracuna: 0,
                    privolaPocekPreostaloDana: 0,
                    privolaZatrazenaDatum: "",
                    privolaObveznik: [],
                    privolaSamSebiObveznik: false,
                    neispunjeneAnkete: false,
                    neispunjeneAnketePIN: "",
                    neispunjeneAnketeURL: "",
                    status: LoginResponseStatus(
                        grupa: "3RP2",
                        godina: "3.",
                        semestar: "Zimski"
                    ),
                    statusAktualnogUpisnogLista: "",
                    napomenaAktualnogUpisnogLista: "",
                    zabranaUpisnogListaZbogDugaIliPrivole: false,
                    blokadaLozinka: false,
                    neprocitanePoruke: false
                )
            )
        )
    }
}
