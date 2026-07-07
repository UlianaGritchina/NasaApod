//
//  ApodAPI.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

public protocol ApodAPI: Sendable {
    func getApod(date: Date) async throws -> ApodDTO
    func getApodImage(for url: URL) async throws -> Data
}
