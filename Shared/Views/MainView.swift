//
//  MainView.swift
//  Infoeduka
//
//  Created by doss on 1/23/22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var model: MainViewModel
    
    var body: some View {
        if let data = model.data {
            Text("Infoeduka")
            ForEach(data, id: \.id) { item in
                Text(item.ikona)
                Text(item.naziv)
            }
        } else {
            Text("Loading...")
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
