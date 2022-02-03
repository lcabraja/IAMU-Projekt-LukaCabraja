//
//  PreviewMainViewModel.swift
//  Infoeduka
//
//  Created by doss on 2/3/22.
//

import Foundation

extension MainViewModel {

    static var preview: MainViewModel {
        let model = MainViewModel()
        model.modelTjedni = TjedniResponseWelcome.preview
        return model
    }
}
