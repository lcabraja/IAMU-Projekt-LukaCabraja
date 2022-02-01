//
//  LoginView.swift
//  Infoeduka
//
//  Created by lcabraja on 1/23/22.
//

import SwiftUI

struct LoginView: View {
    var model = LoginViewModel()
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var launched: Bool = true
    @Namespace private var namespace
    private var launchScreenAnimationID = "LaunchScreenAnimation"
    
    @State private var passwordGot = ""
    
    var body: some View {
        if launched {
            Image(uiImage: UIImage(named: "algebra-logo")!)
                .matchedGeometryEffect(id: launchScreenAnimationID, in: namespace)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.3)) {
                        launched = false
                    }
                }
        } else {
            VStack {
                Image(uiImage: UIImage(named: "algebra-logo")!)
                    .matchedGeometryEffect(id: launchScreenAnimationID, in: namespace)
                TextField("Username", text: $username)
                    .padding(.bottom)
                SecureField("Password", text: $password)
                    .padding(.bottom)
                Button("Login") {
                    model.setCredentials(username, password)
                }
                .font(.largeTitle)
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.light)
    }
}
