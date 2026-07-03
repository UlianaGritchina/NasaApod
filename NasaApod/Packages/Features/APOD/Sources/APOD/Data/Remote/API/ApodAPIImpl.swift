//
//  ApodApi.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Core
import Shared
import Foundation

public final class ApodAPIImpl: ApodAPI {

    private let networkClient: NetworkClient
    
    public init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    public func getApod(date: Date) async throws -> ApodDto {
        let stringDate = date.toString()
        let endPoint = ApodEndpoint.apod(date: stringDate)
        
        return try await networkClient.request(endPoint, response: ApodDto.self)
    }
    
    public func getApodImage(for url: URL) async throws -> Data {
        try await networkClient.download(from: url)
    }
}
