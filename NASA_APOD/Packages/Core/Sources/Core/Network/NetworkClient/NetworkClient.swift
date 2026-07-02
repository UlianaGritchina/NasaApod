//
//  NetworkClientProtocol.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

public protocol NetworkClient: Sendable {
    func request<T: Decodable>(_ endpoint: Endpoint, response: T.Type) async throws -> T
    func download(from url: URL) async throws -> Data
}
