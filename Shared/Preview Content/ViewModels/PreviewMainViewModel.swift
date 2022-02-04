//
//  PreviewMainViewModel.swift
//  Infoeduka
//
//  Created by lcabraja on 2/3/22.
//

import Foundation

extension MainViewModel {

    static var preview: MainViewModel {
        let model = MainViewModel()
        model.modelTjedni = TjedniResponseWelcome.preview
        return model
    }
}
