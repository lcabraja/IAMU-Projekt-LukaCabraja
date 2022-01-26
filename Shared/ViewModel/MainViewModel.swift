//
//  MainViewModel.swift
//  Infoeduka
//
//  Created by doss on 1/24/22.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var modelLogin: LoginResponseWelcome?
    @Published var modelVijestiTagovi: VijestiTagoviResponseWelcome?
    @Published var modelKategorije: KategorijeResponseWelcome?
    @Published var modelVijesti: VijestiResponseWelcome?
    @Published var modelTjedni: TjedniResponseWelcome?
    @Published var modelIspitiPrijava: IspitiPrijavaResponseWelcome?
    @Published var modelIspitiOdjava: IspitiOdjavaResponseWelcome?
    @Published var modelKnjiznicaPodrucja: KnjiznicaPodrucjaResponseWelcome?
    @Published var modelKnjiznicaPodrucjeOdabir: KnjiznicaPodrucjeOdabirResponseWelcome?
    @Published var modelKnjiznicaPosudba: KnjiznicaPosudbaResponseWelcome?
    @Published var modelKnjiznicaVraceno: KnjiznicaVracenoResponseWelcome?
    @Published var modelMaterijali: MaterijaliResponseWelcome?
    @Published var modelBodovi: BodoviResponseWelcome?
    @Published var modelPrisustva: PrisustvaResponseWelcome?
    @Published var modelGrupe: GrupeResponseWelcome?
    @Published var modelPraksa: PraksaResponseWelcome?
    @Published var modelMentori: MentoriResponseWelcome?
    
    func updateModel() {
        let _ = Task {
            if let m = await InfoedukaHttpRequest<VijestiTagoviResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelVijestiTagovi = m
                }
            }
            if let m = await InfoedukaHttpRequest<KategorijeResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelKategorije = m
                }
            }
            if let m = await InfoedukaHttpRequest<VijestiResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelVijesti = m
                }
            }
            if let m = await InfoedukaHttpRequest<TjedniResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelTjedni = m
                }
            }
            if let m = await InfoedukaHttpRequest<IspitiPrijavaResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelIspitiPrijava = m
                }
            }
            if let m = await InfoedukaHttpRequest<IspitiOdjavaResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelIspitiOdjava = m
                }
            }
            if let m = await InfoedukaHttpRequest<KnjiznicaPodrucjaResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelKnjiznicaPodrucja = m
                }
            }
            if let m = await InfoedukaHttpRequest<KnjiznicaPodrucjeOdabirResponseWelcome>.fetch(){
                DispatchQueue.main.async {
                    self.modelKnjiznicaPodrucjeOdabir = m
                }
            }
            if let m = await InfoedukaHttpRequest<KnjiznicaPosudbaResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelKnjiznicaPosudba = m
                }
            }
            if let m = await InfoedukaHttpRequest<KnjiznicaVracenoResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelKnjiznicaVraceno = m
                }
            }
            if let m = await InfoedukaHttpRequest<MaterijaliResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelMaterijali = m
                }
            }
            if let m = await InfoedukaHttpRequest<BodoviResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelBodovi = m
                }
            }
            if let m = await InfoedukaHttpRequest<PrisustvaResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelPrisustva = m
                }
            }
            if let m = await InfoedukaHttpRequest<GrupeResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelGrupe = m
                }
            }
            if let m = await InfoedukaHttpRequest<PraksaResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelPraksa = m
                }
            }
            if let m = await InfoedukaHttpRequest<MentoriResponseWelcome>.fetch() {
                DispatchQueue.main.async {
                    self.modelMentori = m
                }
            }
            DispatchQueue.main.async {
                self.modelLogin = SessionTracker.lastLogin
            }
        }
    }
}
