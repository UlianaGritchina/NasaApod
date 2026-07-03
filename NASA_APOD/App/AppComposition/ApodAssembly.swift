//
//  ApodAssembly.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import APOD
import Core
import Foundation

enum ApodAssembly {
    static func register(in container: DependencyContainer) {
        container.register(ApodAPI.self) {
            ApodAPIImpl(
                networkClient: try! container.resolve(NetworkClient.self)
            )
        }
        
        container.register(ApodRepository.self) {
            ApodRepositoryImpl(
                apodApi: try! container.resolve(ApodAPI.self),
                cacheService: try! container.resolve(CacheService.self)
            )
        }
    }
}
