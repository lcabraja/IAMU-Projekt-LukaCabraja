//
//  BorderExtension.swift
//  Infoeduka
//
//  Created by doss on 2/6/22.
//

import SwiftUI

extension View {
    func algeborder(cornerRadius: Double = 8) -> some View {
        self.overlay {
            RoundedRectangle(cornerRadius: cornerRadius)
            .strokeBorder()
            .algebrientForeground()
        }
    }
}
