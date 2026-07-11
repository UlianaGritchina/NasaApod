//
//  File.swift
//  APOD
//
//  Created by Ульяна Гритчина on 30.06.2026.
//

import Foundation

public enum CacheKey {
    case dalyApod(date: String)
    case dalyApodImage(date: String)
    case apodsList
    
    public var value: String {
        switch self {
        case .dalyApod(let date):
            "daly_apod_\(date)"
        case .dalyApodImage(let date):
            "daly_apod_image_\(date)"
        case .apodsList:
            "apods_list"
        }
    }
}
