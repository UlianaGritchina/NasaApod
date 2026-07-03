//
//  CacheService.swift
//  Core
//
//  Created by Ульяна Гритчина on 30.06.2026.
//

import Foundation

public final class CacheServiceImpl: CacheService, @unchecked Sendable {
    
    private let fileManager = FileManager.default
    private let cacheDirectory: URL
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    public init() throws {
        cacheDirectory = try fileManager
            .url(
                for: .cachesDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true
            )
            .appendingPathComponent("AppCache", isDirectory: true)
        
        try fileManager.createDirectory(
            at: cacheDirectory,
            withIntermediateDirectories: true
        )
    }
    
    private func fileURL(for key: String) -> URL {
        cacheDirectory.appendingPathComponent(key).appendingPathExtension("json")
    }
    
    public func save<T: Codable>(_ value: T, for key: String) throws {
        let data = try encoder.encode(value)
        try data.write(to: fileURL(for: key), options: .atomic)
    }
    
    public func get<T: Codable>(_ key: String, as type: T.Type) throws -> T? {
        let url = fileURL(for: key)
        guard fileManager.fileExists(atPath: url.path) else {
            return nil
        }
        
        let data = try Data(contentsOf: url)
        return try decoder.decode(T.self, from: data)
    }
    
    public func delete(for key: String) throws {
        let url = fileURL(for: key)
        
        guard fileManager.fileExists(atPath: url.path) else {
            return
        }
        
        try fileManager.removeItem(at: url)
    }
    
    public func clear() throws {
        let files = try fileManager.contentsOfDirectory(
            at: cacheDirectory,
            includingPropertiesForKeys: nil
        )
        
        for file in files {
            try fileManager.removeItem(at: file)
        }
    }
}
