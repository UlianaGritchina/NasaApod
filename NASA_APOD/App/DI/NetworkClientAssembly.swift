//
//  NetworkClientAssembly.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import Core
import Foundation

enum NetworkClientAssembly {
    static func register(in container: DependencyContainer, env: AppEnvironment) {
        container.register(NetworkClient.self) {
            NetworkClientImpl(
                baseURL: env.baseURL,
                apiKey: env.apiKey
            )
        }
    }
}

enum CacheServiceAssembly {
    static func register(in container: DependencyContainer, env: AppEnvironment) {
        container.register(CacheService.self) {
            try! CacheServiceImpl()
        }
    }
}
