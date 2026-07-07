//
//  DateExtension.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

public extension Date {
    func toString(format: DateFormat = .base) -> String {
        let date = self
        let formatter = DateFormatter()
        formatter.dateFormat = format.value
        let dateString = formatter.string(from: date)
        return dateString
    }
}
