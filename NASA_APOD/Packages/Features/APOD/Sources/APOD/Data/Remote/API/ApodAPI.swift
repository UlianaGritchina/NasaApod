//
//  ApodAPI.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

public protocol ApodAPI: Sendable {
    func getApod(date: Date) async throws -> ApodDto
    func getApodImage(for url: URL) async throws -> Data
}
