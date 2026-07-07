//
//  ApodAssembly.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import APOD
import Core
import DependencyInjection
import Foundation

enum ApodAssembly {
    static func register(in container: DependencyContainer) {
        container.register(ApodAPI.self) {
            ApodAPIImpl(
                networkClient: try! container.resolve(NetworkClient.self)
            )
        }
        
        container.register(ApodRepository.self) {
#if os(macOS) && DEBUG
            MockApodRepository()
#else
            ApodRepositoryImpl(
                apodApi: try! container.resolve(ApodAPI.self),
                cacheService: try! container.resolve(CacheService.self)
            )
#endif
        }
    }
}
