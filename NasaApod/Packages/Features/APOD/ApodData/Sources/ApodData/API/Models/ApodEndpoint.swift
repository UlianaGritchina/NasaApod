//
//  ApodEndpoint.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Core
import Foundation

enum ApodEndpoint: Endpoint {
    
    case apod(date: String)
    
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
        case .apod(let date): [ URLQueryItem(name: "date", value: date) ]
        }
    }
}
