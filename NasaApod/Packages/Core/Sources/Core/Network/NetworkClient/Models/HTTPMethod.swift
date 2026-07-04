//
//  HTTPMethod.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 26.06.2026.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public typealias HTTPHeaders = [String: String]
