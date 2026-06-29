//
//  EnvironmentLoader.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import Foundation

enum EnvironmentLoader {
    static func load() -> AppEnvironment {
        let env = Bundle.main.object(forInfoDictionaryKey: "APP_ENV") as? String
        switch env {
        case "dev":
            return .dev()
        case "staging":
            return .staging()
        default:
            return .prod()
        }
    }
}
