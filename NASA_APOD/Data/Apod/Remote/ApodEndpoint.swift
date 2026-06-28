//
//  ApodEndpoint.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

enum ApodEndpoint: Endpoint {
    
    case apod(date: String)
    case apodsList(count: Int)
    
    var path: String {
        "/planetary/apod"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: HTTPHeaders {
        [:]
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .apod(let date):
            return [
                URLQueryItem(name: "date", value: date)
            ]
        case .apodsList(let count):
            return [
                URLQueryItem(name: "count", value: "\(count)")
            ]
        }
    }
}
