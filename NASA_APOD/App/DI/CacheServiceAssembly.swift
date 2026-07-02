//
//  CacheServiceAssembly.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 02.07.2026.
//

import Core
import Foundation

enum CacheServiceAssembly {
    static func register(in container: DependencyContainer, env: AppEnvironment) {
        container.register(CacheService.self) {
            try! CacheServiceImpl()
        }
    }
}
