//
//  DateExtension.swift
//  Infoeduka (iOS)
//
//  Created by doss on 2/6/22.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
