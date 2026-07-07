//
//  CoreAssembly.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 03.07.2026.
//

import Core
import DependencyInjection
import Foundation

enum CoreAssembly {
    static func register(in container: DependencyContainer, env: AppEnvironment) {
        container.register(NetworkMonitor.self) {
            NetworkMonitorImpl()
        }
        
        container.register(NetworkClient.self) {
            NetworkClientImpl(
                baseURL: env.baseURL,
                apiKey: env.apiKey
            )
        }
        
        container.register(CacheService.self) {
            try! CacheServiceImpl()
        }
    }
}
