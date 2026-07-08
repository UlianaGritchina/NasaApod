//
//  ExploreAPIImpl.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import Core
import Foundation
import NasaModels

public final class ExploreAPIImpl: ExploreAPI {
    private let networkClient: NetworkClient
    
    public init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    public func getApods(count: Int) async throws -> [ApodDTO] {
        let endPoint = ExploreEndpoint.apodsList(count: count)
        let apodsResponse = try await networkClient.request(
            endPoint,
            response: [ApodDTO].self
        )
        return apodsResponse
    }
}
