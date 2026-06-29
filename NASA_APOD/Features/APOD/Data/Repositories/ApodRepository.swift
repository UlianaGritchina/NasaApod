//
//  ApodRepository.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

protocol ApodRepository {
    func getApod(for date: Date) async throws -> Apod
    func getTodayApod() async throws -> Apod
}

@MainActor
final class ApodRepositoryImpl: ApodRepository {
    
    private let apodApi: ApodAPI
    
    init(apodApi: ApodAPI) {
        self.apodApi = apodApi
    }
    
    func getApod(for date: Date) async throws -> Apod {
        let apodDto = try await apodApi.getApod(date: date)
        return try await apodDto.toDomain()
    }
    
    func getTodayApod() async throws -> Apod {
        let apodDto = try await apodApi.getApod(date: Date())
        return try await apodDto.toDomain()
    }
}
