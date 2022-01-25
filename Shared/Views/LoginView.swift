//
//  LoginView.swift
//  Infoeduka
//
//  Created by doss on 1/23/22.
//

import SwiftUI

struct LoginView: View {
    var model: LoginViewModel
    var mvm: () -> Void
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
            VStack {
                Image(uiImage: UIImage(named: "algebra-logo")!)
                TextField("Username", text: $username)
                    .padding(.bottom)
                SecureField("Password", text: $password)
                    .padding(.bottom)
                Button("Login") {
                    model.setCredentials(username, password)
                    mvm()
                }
                .font(.largeTitle)
            }
            .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let model = LoginViewModel()
        let mainView = MainViewModel()
        LoginView(model: model, mvm: mainView.updateModel)
            .preferredColorScheme(.light)
    }
}
