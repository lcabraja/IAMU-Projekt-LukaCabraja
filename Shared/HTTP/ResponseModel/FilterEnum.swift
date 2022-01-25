//
//  FilterEnum.swift
//  Infoeduka
//
//  Created by doss on 1/25/22.
//

import Foundation

enum InfoedukaFilters: String {
    case svi = ""
    case polozeni = "polozeni=true"
    case nepolozeni = "polozeni=false"
    case aktualni = "aktualni=true"
    
    static func filterUrl(_ url: URL, by value: InfoedukaFilters) -> URL {
        let currentString = url.absoluteString
        if currentString.contains("?") {
            return URL(string: currentString + "&\(value.rawValue)")!
        } else {
            return URL(string: currentString + "?\(value.rawValue)")!
        }
    }
    
    func filterUrl(_ url: URL) -> URL {
        InfoedukaFilters.filterUrl(url, by: self)
    }
 }
