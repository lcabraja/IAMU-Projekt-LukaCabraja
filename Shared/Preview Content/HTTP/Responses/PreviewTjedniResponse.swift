//
//  PreviewTjedniResponse.swift
//  Infoeduka
//
//  Created by lcabraja on 2/3/22.
//

import Foundation

extension TjedniResponseWelcome {
    static var preview: TjedniResponseWelcome {
        let data = [
            TjedniResponseDatum(
                datum: "25-02-2022",
                terminPocetak: "13:15",
                terminKraj: "14:45",
                terminTrajanje: 90,
                dvorana: "Classroom 1-1",
                url: "MS Teams kod za prijavu: xyz1234",
                nastavnik: "Pero Perić",
                tip: .vježbe,
                predmet: "Application Development for Mobile Devices (00-00-000)",
                onlineNapomena: ""
            ),
            TjedniResponseDatum(
                datum: "25-02-2022",
                terminPocetak: "15:00",
                terminKraj: "16:30",
                terminTrajanje: 90,
                dvorana: "Classroom 1-2",
                url: "MS Teams kod za prijavu: xyz1234",
                nastavnik: "Ivan Horvat",
                tip: .vježbe,
                predmet: "Java programming 2 (00-00-000)",
                onlineNapomena: ""
            ),
            TjedniResponseDatum(
                datum: "26-02-2022",
                terminPocetak: "17:00",
                terminKraj: "18:30",
                terminTrajanje: 90,
                dvorana: "Classroom 1-1",
                url: "MS Teams kod za prijavu: xyz1234",
                nastavnik: "Stipe Stipić",
                tip: .predavanje,
                predmet: "Example subject name  (00-00-000)",
                onlineNapomena: ""
            ),
            TjedniResponseDatum(
                datum: "26-02-2022",
                terminPocetak: "18:45",
                terminKraj: "20:15",
                terminTrajanje: 90,
                dvorana: "Classroom 1-2",
                url: "MS Teams kod za prijavu: xyz1234",
                nastavnik: "Ivan Horvat",
                tip: .predavanje,
                predmet: "Example subject name (00-00-000)",
                onlineNapomena: ""
            ),
            TjedniResponseDatum(
                datum: "27-02-2022",
                terminPocetak: "15:00",
                terminKraj: "16:30",
                terminTrajanje: 90,
                dvorana: "Classroom 1-2",
                url: "MS Teams kod za prijavu: xyz1234",
                nastavnik: "Ivan Horvat",
                tip: .predavanje,
                predmet: "Example subject name (00-00-000)",
                onlineNapomena: ""
            ),
            TjedniResponseDatum(
                datum: "27-02-2022",
                terminPocetak: "17:00",
                terminKraj: "18:30",
                terminTrajanje: 90,
                dvorana: "Classroom 1-2",
                url: "MS Teams kod za prijavu: xyz1234",
                nastavnik: "Ivan Horvat",
                tip: .predavanje,
                predmet: "Example subject name (00-00-000)",
                onlineNapomena: ""
            ),
            TjedniResponseDatum(
                datum: "27-02-2022",
                terminPocetak: "18:45",
                terminKraj: "20:15",
                terminTrajanje: 90,
                dvorana: "1-1",
                url: "MS Teams kod za prijavu: xyz1234",
                nastavnik: "Short",
                tip: .predavanje,
                predmet: "Short name (00-00-000)",
                onlineNapomena: ""
            ),
            TjedniResponseDatum(
                datum: "28-02-2022",
                terminPocetak: "11:30",
                terminKraj: "13:00",
                terminTrajanje: 90,
                dvorana: "Building 2 Classroom 1-1",
                url: "MS Teams kod za prijavu: xyz1234",
                nastavnik: "Ivan Horvat",
                tip: .vježbe,
                predmet: "Example subject name (00-00-000)",
                onlineNapomena: ""
            ),
            TjedniResponseDatum(
                datum: "28-02-2022",
                terminPocetak: "13:15",
                terminKraj: "14:45",
                terminTrajanje: 90,
                dvorana: "Building 2 Classroom 1-2",
                url: "MS Teams kod za prijavu: xyz1234",
                nastavnik: "Ivan Horvat",
                tip: .vježbe,
                predmet: "Example subject name (00-00-000)",
                onlineNapomena: ""
            ),
            TjedniResponseDatum(
                datum: "28-02-2022",
                terminPocetak: "15:00",
                terminKraj: "16:30",
                terminTrajanje: 90,
                dvorana: "Classroom 1-3",
                url: "MS Teams kod za prijavu: xyz1234",
                nastavnik: "Ivan Horvat",
                tip: .vježbe,
                predmet: "Example subject name (00-00-000)",
                onlineNapomena: ""
            ),
            TjedniResponseDatum(
                datum: "28-02-2022",
                terminPocetak: "17:00",
                terminKraj: "18:30",
                terminTrajanje: 90,
                dvorana: "Classroom 1-4",
                url: "MS Teams kod za prijavu: xyz1234",
                nastavnik: "Ivan Horvat",
                tip: .vježbe,
                predmet: "Example subject name (00-00-000)",
                onlineNapomena: ""
            ),
            TjedniResponseDatum(
                datum: "01-03-2022",
                terminPocetak: "23:59:00",
                terminKraj: "00:59:00",
                terminTrajanje: 90,
                dvorana: "Example very long location name",
                url: "MS Teams kod za prijavu: xyz1234",
                nastavnik: "Example very long name",
                tip: .ispit,
                predmet: "Example kinda pretty very super duper extra long subject name (00-00-000)",
                onlineNapomena: ""
            )
        ]
        let response = TjedniResponseWelcome(data: data)
        return response
    }
}
