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
                    Image(selected == 0
                          ? "algebrient.house.fill"
                          : "black.house.fill")
                    Text("Početna")
                }
                .tag(0)
            SubjectsTabView()
                .tabItem {
                    Image(selected == 1
                          ? "algebrient.rectangle.fill.on.rectangle.fill"
                          : "black.rectangle.fill.on.rectangle.fill")
                    Text("Predmeti")
                }
                .tag(1)
            ExamsTabView()
                .tabItem {
                    Image(selected == 2
                          ? "algebrient.list.bullet.rectangle.portrait.fill"
                          : "black.list.bullet.rectangle.portrait.fill")
                    Text("Ispiti")
                }
                .tag(2)
            ScheduleTabView()
                .tabItem {
                    Image(selected == 3
                          ? "algebrient.calendar"
                          : "black.calendar")
                    Text("Raspored")
                }
                .tag(3)
            MeTabView()
                .tabItem {
                    Image(selected == 4
                          ? "algebrient.person.crop.circle.fill"
                          : "black.person.crop.circle.fill")
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
        
        MainView(model: MainViewModel.preview)
            .preferredColorScheme(.light)
    }
}
