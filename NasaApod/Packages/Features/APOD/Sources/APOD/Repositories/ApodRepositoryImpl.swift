//
//  ApodRepositoryImpl.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Core
import Foundation
import NasaModels

public final class ApodRepositoryImpl: ApodRepository {
    
    private let apodApi: ApodAPI
    private let cacheService: CacheService
    
    public init(apodApi: ApodAPI, cacheService: CacheService) {
        self.apodApi = apodApi
        self.cacheService = cacheService
    }
    
    public func getApod(for date: Date) async throws -> Apod {
        let stringDate = date.toString()
        let cacheKey = CacheKey.dalyApod(date: stringDate).value
        
        if let cachedApod = try? cacheService.get(cacheKey, as: CachedApod.self) {
            return cachedApod.toDomain()
        }
        
        let apod = try await apodApi.getApod(date: date).toDomain()
        
        let cachedApodForSave = CachedApod(apod: apod)
        try? cacheService.save(cachedApodForSave, for: cacheKey)
        
        return apod
    }
    
    public func getApodImageData(for url: URL, date: Date) async throws -> Data {
        let cacheKey = CacheKey.dalyApodImage(date: date.toString()).value
        
        if let cacheImageData = try? cacheService.get(cacheKey, as: Data.self) {
            return cacheImageData
        }
        
        let imageData = try await apodApi.getApodImage(for: url)

        try cacheService.save(imageData, for: cacheKey)
        
        return imageData
    }
}
