//
//  AppEnvironment.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import Foundation

struct AppEnvironment {
    let type: EnvironmentType
    let baseURL: URL
    let apiKey: String
    static let current: AppEnvironment = .dev()
}

extension AppEnvironment {
    
    static func dev() -> AppEnvironment {
        .init(
            type: .dev,
            baseURL: URL(string: NasaApiConfig.baseURL.rawValue)!,
            apiKey: NasaApiConfig.demoKey.rawValue
        )
    }
    
    static func prod() -> AppEnvironment {
        .init(
            type: .prod,
            baseURL: URL(string: NasaApiConfig.baseURL.rawValue)!,
            apiKey: NasaApiConfig.apiKey.rawValue
        )
    }
}
