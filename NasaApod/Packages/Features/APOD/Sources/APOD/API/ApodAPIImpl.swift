//
//  ApodApi.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import AppFoundation
import Core
import Foundation
import NasaModels

public final class ApodAPIImpl: ApodAPI {

    private let networkClient: NetworkClient
    
    public init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    public func getApod(date: Date) async throws -> ApodDTO {
        let stringDate = date.toString()
        let endPoint = ApodEndpoint.apod(date: stringDate)
        
        return try await networkClient.request(endPoint, response: ApodDTO.self)
    }
    
    public func getApodImage(for url: URL) async throws -> Data {
        try await networkClient.download(from: url)
    }
}
