//
//  EnvironmentLoader.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import Foundation

enum EnvironmentLoader {
    static func load() -> AppEnvironment {
        let env = Bundle.main.object(forInfoDictionaryKey: "APP_ENV") as? String
        switch env {
        case "prod": return .prod()
        default: return .dev()
        }
    }
}
