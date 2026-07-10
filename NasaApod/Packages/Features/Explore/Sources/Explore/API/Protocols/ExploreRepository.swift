//
//  ExploreRepository.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import ApodDomain
import Foundation

public protocol ExploreRepository: Sendable {
    func fetchApods(count: Int) async throws -> [Apod]
    func fetchCachedApods() throws -> [Apod]
}
