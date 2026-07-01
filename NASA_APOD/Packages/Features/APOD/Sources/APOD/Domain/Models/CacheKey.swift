//
//  File.swift
//  APOD
//
//  Created by Ульяна Гритчина on 30.06.2026.
//

import Foundation

enum CacheKey {
    case dalyApod(date: String)
    case dalyApodImage(url: String)
    
    var value: String {
        switch self {
        case .dalyApod(let date):
            "daly_apod_\(date)"
        case .dalyApodImage(let url):
            "daly_apod_image_\(url)"
        }
    }
}
