//
//  MainViewModel.swift
//  Infoeduka
//
//  Created by doss on 1/24/22.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var model: VijestiTagoviResponseWelcome?
    
    func updateModel() {
        let _ = Task {
            let data = await InfoedukaHttpRequest<VijestiTagoviResponseWelcome>.fetch()
            model = data
        }
    }
    
    var data: [TagoviResponseDatum]? {
        model?.data
    }
}
