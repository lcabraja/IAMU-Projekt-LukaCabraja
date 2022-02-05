//
//  FontExtension.swift
//  Infoeduka
//
//  Created by doss on 2/4/22.
//

import SwiftUI

extension Font {
    enum AlgebraFont: String {
        case StolzlBold = "Stolzl-Bold"
        case StolzlBook = "Stolzl-Book"
        case StolzlLight = "Stolzl-Light"
        case StolzlMedium = "Stolzl-Medium"
        case StolzlRegular = "Stolzl-Regular"
        case StolzlThin = "Stolzl-Thin"
        
        func get(size: CGFloat) -> Font {
            return Font.custom(self.rawValue, size: size)
        }
        
        func get(size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
            return Font.custom(self.rawValue, size: size, relativeTo: textStyle)
        }
    }
}

extension Text {
    func algebraFont(_ font: Font.AlgebraFont, size: CGFloat) -> Text {
        return self.font(font.get(size: size))
    }
    
    func algebraFont(_ font: Font.AlgebraFont, size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Text {
        return self.font(font.get(size: size, relativeTo: textStyle))
    }
}
