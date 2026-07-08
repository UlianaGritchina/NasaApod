//
//  ExploreEndpoint.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import Core
import Foundation

enum ExploreEndpoint: Endpoint {
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
        case .apodsList(let count): [ URLQueryItem(name: "count", value: "\(count)")  ]
        }
    }
}
