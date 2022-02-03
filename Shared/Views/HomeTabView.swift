//
//  HomeTabView.swift
//  Infoeduka (iOS)
//
//  Created by doss on 2/3/22.
//

import SwiftUI

struct HomeTabView: View {
    @EnvironmentObject var model: MainViewModel
    
    
//    return self.gradientForeground(colors: [algeborange, algebred])
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Danas") // TODO: Next day of the week / today
                .font(Font.custom("Stolzl-Medium", size: 20))
                .padding([.leading], 7)
                .padding([.bottom], 14)
            Raspored(model: model)
        }
    }
    
    struct Raspored: View {
        @ObservedObject var model: MainViewModel
        
        var body: some View {
            List(model.weeks.onDay(model.nextDay)) { course in
                    RasporedItem(item: course, attendance: model.attendance)
            }
            .padding(.horizontal, -10)
            .listStyle(.plain)
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
                    .font(Font.custom("Stolzl-Regular", size: 17))
                HStack {
                    Text(item.duration)
                        .font(Font.custom("Stolzl-Regular", size: 17))
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
                    .font(Font.custom("Stolzl-Book", size: 13))
                    .foregroundColor(.black)
                    .lineLimit(1)
                Image(systemName: "video.bubble.left")
                    .algebrientForeground()
            }
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(UIColor.label))
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
            .preferredColorScheme(.dark)
            .environmentObject(MainViewModel.preview)
    }
}
