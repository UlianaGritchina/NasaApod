//
//  File.swift
//  APOD
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import Foundation
import NasaModels

public protocol ApodRepository: Sendable {
    func getApod(for date: Date) async throws -> Apod
    func getApodImageData(for url: URL, date: Date) async throws -> Data
}
