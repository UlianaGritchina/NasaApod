//
//  ExploreAPI.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import Foundation
import ApodData

protocol ExploreAPI: Sendable {
    func getApods(count: Int) async throws -> [ApodDTO]
}
