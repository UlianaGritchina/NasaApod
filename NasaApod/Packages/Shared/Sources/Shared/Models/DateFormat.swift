//
//  DateFormat.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

public enum DateFormat {
    /// yyyy-MM-dd (2026-12-11)
    case base
    
    /// dd.MM.yyyy (11.12.2026)
    case full
    
    case custom(String)

    var value: String {
        switch self {
        case .base:  "yyyy-MM-dd"
        case .full: "dd.MM.yyyy"
        case .custom(let format): format
        }
    }
}
