//
//  ExploreRepository.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import Foundation
import NasaModels

public protocol ExploreRepository: Sendable {
    func fetchApods(count: Int) async throws -> [Apod]
}
