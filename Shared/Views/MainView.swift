//
//  MainView.swift
//  Infoeduka
//
//  Created by lcabraja on 1/23/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var model = MainViewModel()
    
    var body: some View {
        TabView {
            HomeTabView()
                .task {
                    let _ = try? await (model.fetchTjedni(), model.fetchVijesti())
                }
                .tabItem {
                    Image(systemName: "house")
                        .algebrientForeground()
                    Text("Početna")
                }
            SubjectsTabView()
                .tabItem {
                    Image(systemName: "rectangle.on.rectangle")
                    Text("Predmeti")
                }
            ExamsTabView()
                .tabItem {
                    Image(systemName: "calendar")
                        .algebrientForeground()
                    Text("Ispiti")
                }
            ScheduleTabView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait")
                        .algebrientForeground()
                    Text("Raspored")
                }
            MeTabView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Ja")
                }
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

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(
            gradient: .init(colors: colors),
            startPoint: .leading,
            endPoint: .trailing)
        )
        .mask(self)
    }
    
    public func algebrientForeground() -> some View {
        let algeborange = Color(red: 226.0/255.0, green: 114.0/255.0, blue: 16.0/255.0) // #E27210
        let algebred = Color(red: 196.0/255.0, green: 15.0/255.0, blue: 97.0/255.0) // #C40F61
        return self.gradientForeground(colors: [algeborange, algebred])
    }
}
