//
//  SubjectsTabView.swift
//  Infoeduka (iOS)
//
//  Created by lcabraja on 2/3/22.
//

import SwiftUI

struct SubjectsTabView: View {
    //    @EnvironmentObject var model: MainViewModel
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Subject(name: "Organizacija i management")) {
                    SubjectListItem(examIsAvailable: true)
                }
                NavigationLink(destination: Subject(name: "Organizacija i management")) {
                    SubjectListItem(examIsAvailable: false)
                }
                NavigationLink(destination: Subject(name: "Organizacija i management")) {
                    SubjectListItem(examIsAvailable: false)
                }
                NavigationLink(destination: Subject(name: "Organizacija i management")) {
                    SubjectListItem(examIsAvailable: true)
                }
            }
        }
    }
    
    struct SubjectListItem: View {
        var examIsAvailable: Bool = false
        
        var body: some View {
            //            HStack {
            VStack(alignment: .leading) {
                Text("Organizacija i management")
                    .algebraFont(.StolzlMedium, size: 17)
                    .padding(.bottom, 4)
                HStack {
                    Group {
                        VStack {
                            Group {
                                DoubleText(lhs: "Ocjena", rhs: "3", rhsColor: .green )
                                DoubleText(lhs: "Bodovi", rhs: "3", rhsColor: .green )
                                DoubleText(lhs: "Potpis", rhs: "3", rhsColor: .green )
                            }
                            .padding(1)
                        }
                        Spacer()
                    }.layoutPriority(1)
                    VStack(alignment: .leading) {
                        Group {
                            DoubleText(lhs: "Predavanja", rhs: "3", rhsColor: .green )
                            DoubleText(lhs: "Vježbe", rhs: "3", rhsColor: .green )
                        }
                        .padding(1)
                        if examIsAvailable {
                            ExamAvailable()
                        } else {
                            Spacer()
                        }
                    }
                    .layoutPriority(2)
                    
                }
                .lineLimit(1)
                //                }
                //                Image(systemName: "chevron.forward")
                //                    .algebrientForeground()
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
