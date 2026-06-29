//
//  ApodAPI.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

protocol ApodAPI {
    func getApod(date: Date) async throws -> ApodDto
}
