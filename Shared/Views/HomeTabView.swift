//
//  HomeTabView.swift
//  Infoeduka (iOS)
//
//  Created by doss on 2/3/22.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var model: MainViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Danas") // TODO: Next day of the week / today
                .font(.title)
            Raspored(model: model)
        }
    }
    
    struct Raspored: View {
        @ObservedObject var model: MainViewModel
        
        var body: some View {
            List(model.weeks.onDay(model.nextDay)) { course in
                    RasporedItem(item: course, attendance: model.attendance)
            }
            .refreshable {
                try? await model.fetchTjedni()
            }
        }
    }
    
    struct RasporedItem: View {
        var item: MainViewModel.IdentifiableScheduleItem
        var attendance: (String, TjedniResponseTip) -> Double?
        
        private var color: Color {
            switch self.item.tip {
            case .predavanje: return Color.blue
            case .vježbe: return Color.orange
            case .ispit: return Color.purple
            }
        }
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(item.predmetClear)
                    .font(.title)
                HStack {
                    Text(item.duration)
                        .font(.title2)
                        .foregroundColor(color)
                    Spacer()
                    Location(hall: item.dvorana, teams: item.teamsCode)
                }
            }
        }
    }
    
    struct Location: View {
        let hall: String
        let teams: String
        
        @State var physical: Bool = true
        
        var body: some View {
            HStack {
                Text(physical ? hall : teams)
                    .lineLimit(1)
                Image(systemName: "video.bubble.left")
                    .algebrientForeground()
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 180).fill(.secondary)
            )
            .onTapGesture {
                if !teams.isEmpty {
                    physical.toggle()
                }
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
