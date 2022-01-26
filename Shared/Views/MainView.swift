//
//  MainView.swift
//  Infoeduka
//
//  Created by doss on 1/23/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var model: MainViewModel
    @State var which: Bool = false
    
    var body: some View {
        VStack {
            if which {
                TabView {
                    modelLoginView
                    modelVijestiTagoviView
                    modelKategorijeView
                    modelVijestiView
                    modelTjedniView
                    modelIspitiPrijavaView
                    modelIspitiOdjavaView
                    modelKnjiznicaPodrucjaView
                    
                }
                .tabViewStyle(.page)
            } else {
                TabView {
                    modelKnjiznicaPodrucjeOdabirView
                    modelKnjiznicaPosudbaView
                    modelKnjiznicaVracenoView
                    modelMaterijaliView
                    modelBodoviView
                    modelPrisustvaView
                    modelGrupeView
                    modelPraksaView
                    modelMentoriView
                }
                .tabViewStyle(.page)
            }
            Button("switcho") {
                which.toggle()
            }
        }
    }
    
    var modelLoginView: some View {
        if let m = model.modelLogin {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelVijestiTagoviView: some View {
        if let m = model.modelVijestiTagovi {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelKategorijeView: some View {
        if let m = model.modelKategorije {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelVijestiView: some View {
        if let m = model.modelVijesti {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelTjedniView: some View {
        if let m = model.modelTjedni {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelIspitiPrijavaView: some View {
        if let m = model.modelIspitiPrijava {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelIspitiOdjavaView: some View {
        if let m = model.modelIspitiOdjava {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelKnjiznicaPodrucjaView: some View {
        if let m = model.modelKnjiznicaPodrucja {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelKnjiznicaPodrucjeOdabirView: some View {
        if let m = model.modelKnjiznicaPodrucjeOdabir {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelKnjiznicaPosudbaView: some View {
        if let m = model.modelKnjiznicaPosudba {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelKnjiznicaVracenoView: some View {
        if let m = model.modelKnjiznicaVraceno {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelMaterijaliView: some View {
        if let m = model.modelMaterijali {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelBodoviView: some View {
        if let m = model.modelBodovi {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelPrisustvaView: some View {
        if let m = model.modelPrisustva {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelGrupeView: some View {
        if let m = model.modelGrupe {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelPraksaView: some View {
        if let m = model.modelPraksa {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
    var modelMentoriView: some View {
        if let m = model.modelMentori {
            return Text(String(describing: m))
        } else {
            return Text("Loading...")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var mainView = MainViewModel()
    static var previews: some View {
        MainView(model: mainView)
            .preferredColorScheme(.dark)
    }
}
