//
//  HTTPMethod.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 26.06.2026.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

typealias HTTPHeaders = [String: String]
