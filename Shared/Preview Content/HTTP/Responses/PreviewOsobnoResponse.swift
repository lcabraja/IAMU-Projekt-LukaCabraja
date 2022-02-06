//
//  PreviewOsobnoResponse.swift
//  Infoeduka
//
//  Created by doss on 2/6/22.
//

import Foundation

extension OsobnoResponseWelcome {
    static var preview: OsobnoResponseWelcome {
        OsobnoResponseWelcome(
            data: OsobnoResponseData(
                jmbag: "0000000000",
                email: "cbrala@racunarstvo.hr",
                telefon: "099/9999-999",
                mobitel: "099/9999-999",
                spol: 1,
                oib: "12345678910",
                imeOca: "Zdravko",
                slika: "https://i.imgur.com/F1XqUJK.png",
                rodjenjeDatum: "01.01.2000.",
                rodjenjeMjesto: "GRAD ZAGREB",
                rodjenjeZupanija: "GRAD ZAGREB",
                rodjenjeDrzava: "HRVATSKA",
                narodnost: "Hrvati",
                drzavljanstvo: "HRVATSKA",
                boravisteAdresa: "Ilica 242",
                boravistePostBroj: "10000",
                boravistePostUred: "Zagreb",
                boravisteMjesto: "ZAGREB",
                boravisteDrzava: "HRVATSKA",
                zavrsenaSkolaNaziv: "Opća Biološka",
                zavrsenaSkolaVrsta: "biološka",
                zavrsenaSkolaGodina: "2010",
                zavrsenaSkolaMjesto: "GRAD ZAGREB",
                zavrsenaSkolaZupanija: "GRAD ZAGREB",
                zavrsenaSkolaDrzava: "HRVATSKA"
            )
        )
    }
}
