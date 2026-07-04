//
//  NetworkError.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 27.06.2026.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case serverError(Int)
    case decoding(Error)
    case unknown(Error)
}
