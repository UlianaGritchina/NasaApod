//
//  DateExtension.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

public extension Date {
    func toString(format: DateFormat = .base) -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        let dateString = formatter.string(from: date)
        return dateString
    }
}
