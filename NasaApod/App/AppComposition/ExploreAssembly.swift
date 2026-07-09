//
//  ExploreAssembly.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import Core
import DependencyInjection
import Explore
import Foundation

enum ExploreAssembly {
    static func register(in container: DependencyContainer) {
        container.register(ExploreAPI.self) {
            ExploreAPIImpl(
                networkClient: try! container.resolve(NetworkClient.self)
            )
        }
        
        container.register(ExploreRepository.self) {
            ExploreRepositoryImpl(
                exploreAPI: try! container.resolve(ExploreAPI.self),
                cacheService: try! container.resolve(CacheService.self)
            )
        }
    }
}
