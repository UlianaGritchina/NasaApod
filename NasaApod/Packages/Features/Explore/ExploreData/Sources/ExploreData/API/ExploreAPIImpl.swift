//
//  ExploreAPIImpl.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import Core
import Foundation
import ApodData

final class ExploreAPIImpl: ExploreAPI {
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getApods(count: Int) async throws -> [ApodDTO] {
        let endPoint = ExploreEndpoint.apodsList(count: count)
        let apodsResponse = try await networkClient.request(
            endPoint,
            response: [ApodDTO].self
        )
        return apodsResponse
    }
}
