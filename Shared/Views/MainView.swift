//
//  MainView.swift
//  Infoeduka
//
//  Created by lcabraja on 1/23/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var model = MainViewModel()
    
    @State var selected = 0
    var body: some View {
        TabView(selection: $selected) {
            HomeTabView()
                .task {
                    let _ = try? await (
                        model.fetchTjedni(),
                        model.fetchOsobno(),
                        model.fetchVijesti(),
                        model.fetchMaterijali()
                    )
                }
                .tabItem {
                    selected == 0 ?
                        Image("house.fill") :
                        Image(systemName: "house.fill")
                    Text("Početna")
                }
                .tag(0)
            SubjectsTabView()
                .tabItem {
                    selected == 1 ?
                        Image("rectangle.fill.on.rectangle.fill") :
                        Image(systemName: "rectangle.on.rectangle.fill")
                    Text("Predmeti")
                }
                .tag(1)
            ExamsTabView()
                .tabItem {
                    selected == 2 ? Image("calendar") : Image(systemName: "calendar")
                    Text("Ispiti")
                }
                .tag(2)
            ScheduleTabView()
                .tabItem {
                    selected == 3 ? Image("list.bullet.rectangle.portrait.fill") :
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                    Text("Raspored")
                }
                .tag(3)
            MeTabView()
                .tabItem {
                    selected == 4 ?
                        Image("person.crop.circle.fill") :
                        Image(systemName: "person.crop.circle.fill")
                    Text("Ja")
                }
                .tag(4)
        }
        .environmentObject(model)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(model: MainViewModel.preview)
            .preferredColorScheme(.dark)
    }
}
