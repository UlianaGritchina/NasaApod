//
//  ApodApi.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

final class ApodAPIImpl: ApodAPI {
    
    private let client: NetworkClientProtocol
    
    init(client: NetworkClientProtocol) {
        self.client = client
    }
    
    func getApod(date: Date) async throws -> ApodDto {
        let stringDate = date.toString()
        let endPoint = ApodEndpoint.apod(date: stringDate)
        
        return try await client.request(endPoint, response: ApodDto.self)
    }
}
