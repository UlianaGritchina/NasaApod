//
//  ExploreAssembly.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import Core
import DependencyContainer
import ExploreDomain
import Foundation

public enum ExploreAssembly {
    public static func register(in container: DependencyContainer) {
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
