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
            Spacer()
            topText
            ProfilePic(imageUrl: model.modelOsobno?.data.slika ?? "")
            bottomText
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
                    .font(.system(size: 32))
                    .algebrientForeground()
            }.sheet(isPresented: $isModal) {
                Settings()
            }
        }
    }
    
    
    @ViewBuilder var topText: some View {
        Text("Grupa: \(SessionTracker.lastLogin?.data.dodatno.status.grupa ?? "")")
            .algebraFont(.StolzlMedium, size: 17, relativeTo: .title)
            .foregroundColor(.secondary)
        Text(model.modelMaterijali?.data.first?.godine.first?.smjer ?? "")
            .algebraFont(.StolzlMedium, size: 17, relativeTo: .title)
            .foregroundColor(.primary)
    }
    
    @ViewBuilder var bottomText: some View {
        Text(SessionTracker.lastLogin?.data.korisnik ?? "")
            .algebraFont(.StolzlRegular, size: 17)
            .foregroundColor(.primary)
        Text("\(CredentialsManager.getUsername() ?? "")@racunarstvo.hr")
            .algebraFont(.StolzlBook, size: 13)
            .foregroundColor(.secondary)
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
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(Circle())
            case .failure(_):
                Image(systemName: "ant.circle.fill")
                    .resizable()
                    .frame(maxWidth: .infinity)
            case .empty:
                Circle()
                    .stroke()
                    .algebrientForeground()
                    .frame(maxWidth: .infinity)
            @unknown default:
                ProgressView()
            }
        }
        .padding([.horizontal], 100)
    }
}

struct Settings: View {
    var body: some View {
        Button(action: {
            CredentialsManager.shared.credentials = nil
        }) {
            Text("Sign Out")
        }
    }
}

struct MeTabView_Previews: PreviewProvider {
    static var previews: some View {
        MeTabView()
    }
}
