//
//  ImagePipeline.swift
//  AsyncCachedImage
//
//  Created by Ульяна Гритчина on 13.07.2026.
//

import Foundation

protocol ImagePipeline: Sendable {
    func getImageData(for url: URL) async throws -> Data
}

final class ImagePipelineImpl: ImagePipeline {
    
    let memoryCache: MemoryCacheService
    let networkImageLoader: NetworkImageLoader
    
    public static let shared = ImagePipelineImpl()
    
    private init() {
        self.memoryCache = MemoryCacheServiceImpl()
        self.networkImageLoader = NetworkImageLoaderImpl()
    }
    
    func getImageData(for url: URL) async throws -> Data {
        let cacheKey = url.absoluteString
        
        if let cachedImageData = memoryCache.get(key: cacheKey) {
            return cachedImageData
        }
        
        let imageData = try await networkImageLoader.data(from: url)
        
        memoryCache.save(data: imageData, for: cacheKey)
        
        return imageData
    }
}
