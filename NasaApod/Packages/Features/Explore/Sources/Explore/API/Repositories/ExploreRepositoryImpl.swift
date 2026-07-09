//
//  ExploreRepositoryImpl.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import Core
import Foundation
import NasaModels

public final class ExploreRepositoryImpl: ExploreRepository {
    let exploreAPI: ExploreAPI
    let cacheService: CacheService
    
    public init(exploreAPI: ExploreAPI, cacheService: CacheService) {
        self.exploreAPI = exploreAPI
        self.cacheService = cacheService
    }
    
    public func fetchApods(count: Int) async throws -> [Apod] {
        let cacheKey = CacheKey.apodsList.value
        
        let apodsDto = try await exploreAPI.getApods(count: count)
        let apods = try apodsDto.compactMap({ try $0.toDomain() })
        let apodsForCache = apods.compactMap({ CachedApod(apod: $0 )})
        
        try cacheService.save(apodsForCache, for: cacheKey)
        
        return apods
    }
    
    public func fetchCachedApods() throws -> [Apod] {
        let cacheKey = CacheKey.apodsList.value
        
        if let cachedApods = try? cacheService.get(cacheKey, as: [CachedApod].self) {
            return cachedApods.compactMap({ $0.toDomain() })
        } else {
            return []
        }
    }
}

