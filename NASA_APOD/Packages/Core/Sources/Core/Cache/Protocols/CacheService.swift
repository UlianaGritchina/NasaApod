//
//  File.swift
//  Core
//
//  Created by Ульяна Гритчина on 01.07.2026.
//

import Foundation

public protocol CacheService: Sendable {
    func save<T: Codable>(_ value: T, for key: String) throws
    func get<T: Codable>(_ key: String, as type: T.Type) throws -> T?
    func delete(for key: String) throws
    func clear() throws
}
