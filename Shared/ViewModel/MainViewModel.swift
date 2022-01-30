//
//  MainViewModel.swift
//  Infoeduka
//
//  Created by lcabraja on 1/24/22.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var modelTjedni: TjedniResponseWelcome?
    @Published var modelVijesti: VijestiResponseWelcome?
    @Published var modelIspitiPrijava: IspitiPrijavaResponseWelcome?
    @Published var modelIspitiOdjava: IspitiOdjavaResponseWelcome?
    @Published var modelMaterijali: MaterijaliResponseWelcome?
    @Published var modelBodovi: BodoviResponseWelcome?
    @Published var modelPrisustva: PrisustvaResponseWelcome?
    @Published var modelLogin: LoginResponseWelcome?
    
    init() {
        sharedCredentialsManager.subscribe(subscriber: fetchData)
    }
    
    func fetchData() {
        guard sharedCredentialsManager.hasCredentials else { return }
        let _ = Task {
            if self.modelTjedni == nil { await InfoedukaHttpRequest<TjedniResponseWelcome>.fetch() { model in self.modelTjedni = model }}
            if self.modelPrisustva == nil { await InfoedukaHttpRequest<PrisustvaResponseWelcome>.fetch() { model in self.modelPrisustva = model }}

            if false {
                await InfoedukaHttpRequest<VijestiResponseWelcome>.fetch() { model in self.modelVijesti = model }
                await InfoedukaHttpRequest<IspitiPrijavaResponseWelcome>.fetch() { model in self.modelIspitiPrijava = model }
                await InfoedukaHttpRequest<IspitiOdjavaResponseWelcome>.fetch() { model in self.modelIspitiOdjava = model }
                await InfoedukaHttpRequest<MaterijaliResponseWelcome>.fetch() { model in self.modelMaterijali = model }
                await InfoedukaHttpRequest<BodoviResponseWelcome>.fetch() { model in self.modelBodovi = model }
            }
            DispatchQueue.main.async { self.modelLogin = SessionTracker.lastLogin }
        }
    }
    
    private var subjectsAttendance: [PrisustvaResponsePredmeti]? {
        modelPrisustva?.flatten()
    }
    
    var weeks: [IdentifiableScheduleItem] {
        guard let data = modelTjedni?.data else { return [] }
        var _weeks = [IdentifiableScheduleItem]()
        for week in data {
            _weeks.append(IdentifiableScheduleItem(week))
        }
        return _weeks
    }
    
    private var dateFormatter: DateFormatter {
        let _df = DateFormatter()
        _df.dateFormat = "dd.MM.yyyy."
        return _df
    }
    
    var uniqueDays: [IdentifiableDay] {
        guard let data = modelTjedni?.data else { return [] }
        var _days = Set<IdentifiableDay>()
        data.forEach { _days.insert(IdentifiableDay(id: $0.datum)) }
        return Array(_days).sorted {
            guard
                let lhs = dateFormatter.date(from: $0.id),
                let rhs = dateFormatter.date(from: $1.id)
            else { return false }
            return lhs < rhs
        }
    }
    
    func attendance(for className: String, type: TjedniResponseTip) -> Double? {
        guard type != TjedniResponseTip.ispit else { return nil }
        guard let attendance = subjectsAttendance?.findByName(className)?.dodatno.prisustva else { return nil }
        switch type {
        case .predavanje: return attendance.predavanja.postotakOdradjeno
        case .vježbe: return attendance.vjezbe.postotakOdradjeno
        default: return nil
        }
    }
    
    struct IdentifiableScheduleItem: Identifiable {
        private static var _idIterator = 0
        private static var idIterator: Int {
            _idIterator += 1
            return _idIterator - 1
        }
        
        var predmetClear: String {
            let regex = "\\(.+" // Izrada aplikacija za mobilne uređaje (21-00-47)
            return self.predmet.replacingOccurrences(of: regex, with: "", options: [.regularExpression])
        }
        
        var teamsCode: String {
            let string = "MS Teams kod za prijavu: " // MS Teams kod za prijavu: wlh0c7n
            return self.url.replacingOccurrences(of: string, with: "", options: [])
        }
        
        let datum, terminPocetak, terminKraj: String
        let terminTrajanje: Int
        let dvorana, url, nastavnik: String
        let tip: TjedniResponseTip
        let predmet: String
        let onlineNapomena: String?
        let id: Int
        
        init(_ t: TjedniResponseDatum) {
            datum = t.datum
            terminPocetak = t.terminPocetak
            terminKraj = t.terminKraj
            terminTrajanje = t.terminTrajanje
            dvorana = t.dvorana
            url = t.url
            nastavnik = t.nastavnik
            tip = t.tip
            predmet = t.predmet
            onlineNapomena = t.onlineNapomena
            id = IdentifiableScheduleItem.idIterator
        }
    }
    struct IdentifiableDay: Identifiable, Hashable {
        let id: String
    }
}

extension Array where Element == MainViewModel.IdentifiableScheduleItem {
    func onDay(_ day: MainViewModel.IdentifiableDay) -> [MainViewModel.IdentifiableScheduleItem] {
        self.filter { $0.datum == day.id }
    }
}

extension Array where Element == PrisustvaResponsePredmeti {
    func findByName(_ subjectName: String) -> Element? {
        self.filter({ "\($0.predmet) (\($0.sifra))" == subjectName }).first
    }
}
