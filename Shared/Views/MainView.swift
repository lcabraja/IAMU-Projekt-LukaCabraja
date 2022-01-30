//
//  MainView.swift
//  Infoeduka
//
//  Created by lcabraja on 1/23/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var model: MainViewModel
    
    var body: some View {
        VStack {
            Text("Infoeduka")
                .font(.largeTitle)
                .gradientForeground(colors: [.red, .orange])
            Spacer()
            raspored
        }
    }
    
    var raspored: some View {
        List {
            ForEach(model.uniqueDays) { day in
                Section(header: Text(day.id)) { // day of the week
                    ForEach(model.weeks.onDay(day)) { course in
                        RasporedItem(item: course, attendance: model.attendance)
                    }
                }
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
            ZStack {
                VStack {
                    Text("\(item.terminPocetak) - \(item.terminKraj)")
                        .foregroundColor(color)
                        .font(.title2)
                    Divider()
                        .background(color)
                        .padding(.horizontal, 32)
                    Text(item.predmetClear)
                        .font(.title3)
                    HStack {
                        Location(hall: item.dvorana, teams: item.teamsCode)
                        Spacer()
                        if let percent = attendance(item.predmet, item.tip) {
                            Attendance(percent: percent , type: item.tip)
                        }
                    }
                }
            }
        }
    }
    
    struct Location: View {
        let hall: String
        let teams: String
        
        @State var physical: Bool = true
        
        var body: some View {
            Text(physical ? hall : teams)
                .lineLimit(1)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(.secondary)
                )
                .onTapGesture {
                    if !teams.isEmpty {
                        physical.toggle()
                    }
                }
        }
    }
    
    struct Attendance: View {
        var percent: Double
        var type: TjedniResponseTip
        
        private var color: Color {
            switch type {
            case .predavanje: return percent >= 0.5 ? Color.green : Color.red
            case .vježbe: return percent >= 0.6 ? Color.green : Color.red
            default: return Color.red
            }
        }
        
        var body: some View {
//          draw a semicircle
//            if percent != nil && type != .ispit {
//                Circle()
//                    .stroke(lineWidth: 10)
//                    .foregroundColor(color)
//            } else {
//                Circle().fill(.pink)
//            }
            Text("\(Int(percent))%")
                .foregroundColor(color)
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

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(
            gradient: .init(colors: colors),
            startPoint: .leading,
            endPoint: .trailing)
        )
        .mask(self)
    }
}
