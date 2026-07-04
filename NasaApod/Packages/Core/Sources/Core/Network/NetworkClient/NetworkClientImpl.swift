//
//  NetworkClient.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

public final class NetworkClientImpl: NetworkClient {
    
    private let baseURL: URL
    private let apiKey: String
    private let session: URLSession
    
    public init(baseURL: URL, apiKey: String, session: URLSession = .shared) {
        self.session = session
        self.apiKey = apiKey
        self.baseURL = baseURL
    }
    
    public func request<T: Decodable>(_ endpoint: Endpoint, response: T.Type) async throws -> T {
        
        var components = URLComponents(
            url: baseURL.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        )!
        
        var queryItems = endpoint.queryItems
        queryItems.append(URLQueryItem(name: "api_key", value: apiKey))
        components.queryItems = queryItems
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = endpoint.method.rawValue
        
        endpoint.headers.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }
        
        let (data, response) = try await session.data(for: request)
        
        guard let http = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard 200...299 ~= http.statusCode else {
            throw NetworkError.serverError(http.statusCode)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    public func download(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
