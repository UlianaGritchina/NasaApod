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
    
    public init(exploreAPI: ExploreAPI) {
        self.exploreAPI = exploreAPI
    }
    
    public func fetchApods(count: Int) async throws -> [Apod] {
        let apodsDto = try await exploreAPI.getApods(count: count)
        return try apodsDto.compactMap({ try $0.toDomain() })
    }
}

