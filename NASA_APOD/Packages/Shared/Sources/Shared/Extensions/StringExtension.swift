//
//  StringExtension.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

public extension String {
    func toDate(format: DateFormat = .base) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.date(from: self)
    }
}
