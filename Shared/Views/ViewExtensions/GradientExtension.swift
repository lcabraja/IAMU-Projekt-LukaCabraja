//
//  GradientExtension.swift
//  Infoeduka (iOS)
//
//  Created by doss on 2/4/22.
//

import SwiftUI

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(
            gradient: .init(colors: colors),
            startPoint: .leading,
            endPoint: .trailing)
        )
        .mask(self)
    }
    
    public func algebrientForeground() -> some View {
        let algeborange = Color(red: 226.0/255.0, green: 114.0/255.0, blue: 16.0/255.0) // #E27210
        let algebred = Color(red: 196.0/255.0, green: 15.0/255.0, blue: 97.0/255.0) // #C40F61
        return self.gradientForeground(colors: [algeborange, algebred])
    }
}
