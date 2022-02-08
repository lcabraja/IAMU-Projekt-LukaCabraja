//
//  SubjectsExtension.swift
//  Infoeduka (iOS)
//
//  Created by doss on 2/8/22.
//

import Foundation

extension SubjectsResponse {
    var subjects: [ResponseSubject] {
        let _subjects = [ResponseSubject]()
        self.data.forEach {
            $0.years.forEach {
                $0.subjects.forEach {
                    _subjects.append($0)
                }
            }
        }
        return _subjects
    }
}
