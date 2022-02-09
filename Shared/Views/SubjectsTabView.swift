//
//  SubjectsTabView.swift
//  Infoeduka (iOS)
//
//  Created by lcabraja on 2/3/22.
//

import SwiftUI

struct SubjectsTabView: View {
    @EnvironmentObject var model: MainViewModel
    
    var body: some View {
            NavigationView {
                VStack(alignment: .leading) {
                Text("Predmeti")
                    .algebraFont(.StolzlMedium, size: 20)
                    .padding([.leading], 7)
                    .padding([.bottom], 14)
            }
        }
    }
    
    struct SubjectListItem: View {
        let examIsAvailable: Bool = false
        let subject: ResponseSubject
        
        
        var columns: [GridItem] {
            [GridItem(.flexible(minimum: 89, maximum: 100)), GridItem(.flexible(minimum: 144))]
        }
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(subject.subject)
                    .algebraFont(.StolzlMedium, size: 17)
                    .lineLimit(2)
                //                    .padding(.bottom, 4)
                LazyVGrid(columns: columns) {
                    VStack {
                        Group {
                            DoubleText(
                                lhs: "Ocjena",
                                rhs: String(subject.grade ?? 0), rhsColor: subject.grade ?? 0 > 1 ? .green : .red
                            )
                            DoubleText(
                                lhs: "Bodovi",
                                rhs: String(subject.additionalData.points?.earnedPoints ?? 00.00),
                                rhsColor: subject.additionalData.points?.satisfied ?? false ? .green : .red
                            )
                            DoubleText(
                                lhs: "Potpis",
                                rhs: subject.signature ? "Da" : "Ne" ,
                                rhsColor: subject.signature ? .green : .red
                            )
                        }
                        .padding(1)
                    }
//                    Spacer()
                    VStack(alignment: .leading) {
                        Group {
                            DoubleText(lhs: "Predavanja", rhs: "\(subject.additionalData.attendance?.lectures.percentComplete ?? 0)%", rhsColor: .green )
                            DoubleText(lhs: "Vježbe", rhs: "\(subject.additionalData.attendance?.labs.percentComplete ?? 0)%", rhsColor: .green )
                        }
                        .padding(1)
                        ExamAvailable()
                            .opacity(examIsAvailable ? 1 : 0)
                    }
                    .padding(.trailing, 15)
                }
            }
            .padding(.vertical, 8)
        }
    }
    
    struct DoubleText: View {
        let lhs: String
        let rhs: String
        
        let rhsColor: Color
        
        var body: some View {
            HStack {
                Text(lhs)
                    .algebraFont(.StolzlBook, size: 13)
                    .foregroundColor(.secondary)
                Spacer()
                Text(rhs)
                    .algebraFont(.StolzlBook, size: 13)
                    .foregroundColor(rhsColor)
            }
        }
    }
    
    struct ExamAvailable: View {
        var body: some View {
            HStack {
                Image(systemName: "doc.text.image")
                    .algebrientForeground()
                Spacer()
                Text("Dostupan ispit")
                    .algebraFont(.StolzlBook, size: 13)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .algeborder()
        }
    }
}

struct Subject: View {
    let name: String
    
    var body: some View {
        Text(name)
    }
}

struct SubjectsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectsTabView()
            .preferredColorScheme(.dark)
        
        SubjectsTabView()
            .preferredColorScheme(.light)
    }
}
