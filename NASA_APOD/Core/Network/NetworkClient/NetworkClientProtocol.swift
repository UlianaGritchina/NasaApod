//
//  NetworkClientProtocol.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

protocol NetworkClientProtocol {
    func request<T: Decodable>(_ endpoint: Endpoint, response: T.Type) async throws -> T
}
