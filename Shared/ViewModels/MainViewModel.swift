//
//  MainViewModel.swift
//  Infoeduka
//
//  Created by lcabraja on 1/24/22.
//

import Foundation

enum DownloadError: Error {
    case failed
}

private actor MainViewModelStore {
    private var loadedTjedni: TjedniResponseWelcome?
    private var loadedOsobno: OsobnoResponseWelcome?
    private var loadedVijesti: VijestiResponseWelcome?
    private var loadedMaterijali: MaterijaliResponseWelcome?
    
    func loadLogin() throws -> LoginResponseWelcome {
        guard let loginResponse = SessionTracker.lastLogin else { throw DownloadError.failed }
        return loginResponse
    }
    
    func loadTjedni() async throws -> TjedniResponseWelcome {
        guard let tjedniResponse = await InfoedukaHttpRequest<TjedniResponseWelcome>.fetch()
        else { throw DownloadError.failed }
        loadedTjedni = tjedniResponse
        return tjedniResponse
    }
    
    func loadOsobno() async throws -> OsobnoResponseWelcome {
        guard let osobnoResponse = await InfoedukaHttpRequest<OsobnoResponseWelcome>.fetch()
        else { throw DownloadError.failed }
        loadedOsobno = osobnoResponse
        return osobnoResponse
    }
    
    func loadVijesti() async throws -> VijestiResponseWelcome {
        guard let vijestiResponse = await InfoedukaHttpRequest<VijestiResponseWelcome>.fetch()
        else { throw DownloadError.failed }
        loadedVijesti = vijestiResponse
        return vijestiResponse
    }
    
    func loadMaterijali() async throws -> MaterijaliResponseWelcome {
        guard let materijaliResponse = await InfoedukaHttpRequest<MaterijaliResponseWelcome>.fetch()
        else { throw DownloadError.failed }
        loadedMaterijali = materijaliResponse
        return materijaliResponse
    }
}

class MainViewModel: ObservableObject {
    // MARK: - data
    
    @Published var modelLogin: LoginResponseWelcome?
    @Published var modelTjedni: TjedniResponseWelcome?
    @Published var fetchingTjedni: Bool = false
    @Published var modelOsobno: OsobnoResponseWelcome?
    @Published var fetchingOsobno: Bool = false
    @Published var modelVijesti: VijestiResponseWelcome?
    @Published var fetchingVijesti: Bool = false
    @Published var modelIspitiPrijava: IspitiPrijavaResponseWelcome?
    @Published var modelIspitiOdjava: IspitiOdjavaResponseWelcome?
    @Published var modelMaterijali: MaterijaliResponseWelcome?
    @Published var fetchingMaterijali: Bool = false
    @Published var modelBodovi: BodoviResponseWelcome?
    @Published var modelPrisustva: PrisustvaResponseWelcome?
    private let store = MainViewModelStore()
    
    init() {
        modelLogin = SessionTracker.lastLogin
    }
    
    // MARK: - ui translation
    
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
    
    var nextDayText: String? {
        guard
            let firstDay = nextDay,
            let date = dateFormatter.date(from: firstDay.id)
        else { return nil }
        return date.dayOfWeek()
    }
    
    var nextDay: IdentifiableDay? {
        let calendar = Calendar.current
        let today = calendar.component(.day, from: Date())
        let month = calendar.component(.month, from: Date())
        return uniqueDays
            .filter {
                guard let date = dateFormatter.date(from: $0.id) else { return false }
                return
                    month <= calendar.component(.month, from: date) &&
                    today <= calendar.component(.day, from: date)
            }
            .first
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
        
        var duration: String {
            var startTime = terminPocetak
            var endTime = terminKraj
            if startTime.count > 5 {
                let startIndex = startTime.index(startTime.startIndex, offsetBy: 5)
                startTime = String(startTime[..<startIndex])
            }
            if endTime.count > 5 {
                let endIndex = endTime.index(endTime.startIndex, offsetBy: 5)
                endTime = String(startTime[..<endIndex])
            }
            return "\(startTime) - \(endTime)"
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

// MARK: - actors

extension MainViewModel {
    
    @MainActor
    func fetchTjedni() async throws {
        fetchingTjedni = true
        defer { fetchingTjedni = false }
        let loadedTjedni = try await store.loadTjedni()
        modelTjedni = loadedTjedni
    }
    
    @MainActor
    func fetchOsobno() async throws {
        fetchingOsobno = true
        defer { fetchingOsobno = false }
        let loadedOsobno = try await store.loadOsobno()
        modelOsobno = loadedOsobno
    }
    
    @MainActor
    func fetchVijesti() async throws {
        fetchingVijesti = true
        defer { fetchingVijesti = false }
        let loadedVijesti = try await store.loadVijesti()
        modelVijesti = loadedVijesti
    }
    
    @MainActor
    func fetchMaterijali() async throws {
        fetchingMaterijali = true
        defer { fetchingMaterijali = false }
        let loadedMaterijali = try await store.loadMaterijali()
        modelMaterijali = loadedMaterijali
    }
}

extension Array where Element == MainViewModel.IdentifiableScheduleItem {
    func onDay(_ day: MainViewModel.IdentifiableDay?) -> [MainViewModel.IdentifiableScheduleItem] {
        guard let day = day else { return [] }
        return self.filter { $0.datum == day.id }
    }
}

extension Array where Element == PrisustvaResponsePredmeti {
    func findByName(_ subjectName: String) -> Element? {
        self.filter({ "\($0.predmet) (\($0.sifra))" == subjectName }).first
    }
}
