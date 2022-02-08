//
//  MeTabView.swift
//  Infoeduka (iOS)
//
//  Created by lcabraja on 2/3/22.
//

import SwiftUI

struct MeTabView: View {
    @EnvironmentObject var model: MainViewModel
    
    @State var isModal: Bool = false
    
    var body: some View {
        VStack {
            settings
            topText
            ProfilePic(imageUrl: model.modelOsobno?.data.slika ?? "")
                .padding(.vertical)
            bottomText
            jmbag
            Spacer()
        }
    }
    
    var settings: some View {
        HStack {
            Spacer()
            Button(action: {
                isModal = true
            }) {
                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 34))
                    .algebrientForeground()
            }.sheet(isPresented: $isModal) {
                Settings()
            }
        }
        .padding(.horizontal, 13)
    }
    
    
    var topText: some View {
        VStack {
            Text("Grupa: \(model.modelLogin?.data.dodatno.status.grupa ?? "")")
                .algebraFont(.StolzlMedium, size: 17, relativeTo: .title)
                .foregroundColor(.secondary)
                .padding(.bottom, 1)
            Text(model.modelSubjects?.data.first?.years.first?.program ?? "")
                .algebraFont(.StolzlMedium, size: 17, relativeTo: .title)
                .foregroundColor(.primary)
        }
        .padding(.bottom)
    }
    
    var bottomText: some View {
        Group {
            Text(model.modelLogin?.data.korisnik ?? "")
                .algebraFont(.StolzlRegular, size: 17)
                .foregroundColor(.primary)
            Text("\(CredentialsManager.getUsername() ?? "")@racunarstvo.hr")
                .algebraFont(.StolzlBook, size: 13)
                .foregroundColor(.secondary)
        }
        .padding(4)
    }
    
    var jmbag: some View {
        HStack {
            Image(systemName: "person.text.rectangle")
                .font(.title)
                .algebrientForeground()
            Text("JMBAG:")
                .algebraFont(.StolzlBook, size: 13)
                .foregroundColor(.secondary)
            Text(model.modelOsobno?.data.jmbag ?? "")
                .algebraFont(.StolzlRegular, size: 17)
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding([.top, .horizontal])
    }
}

struct ProfilePic: View {
    let imageUrl: String
    
    let transaction = Transaction(animation: .spring(response: 0.2, dampingFraction: 0.8, blendDuration: 0.1))
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl), transaction: transaction) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .clipShape(Circle())
            case .failure(_):
                Image("algebrient.person.crop.circle.fill")
                    .resizable()
            case .empty:
                ZStack {
                    ProgressView()
                    Circle()
                        .strokeBorder()
                        .algebrientForeground()
                }
            @unknown default:
                ProgressView()
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .frame(maxWidth: .infinity)
        .padding([.horizontal], 124)
    }
}

struct Settings: View {
    var body: some View {
        Button("Sign Out") {
            CredentialsManager.shared.credentials = nil
        }
    }
}

struct MeTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MeTabView()
                .preferredColorScheme(.dark)
            MeTabView()
                .preferredColorScheme(.light)
        }
        .environmentObject(MainViewModel.preview)
    }
}
