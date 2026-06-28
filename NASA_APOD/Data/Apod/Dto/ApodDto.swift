//
//  ApodDto.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 26.06.2026.
//

import Foundation

struct ApodDto: Decodable {
    let copyright: String?
    let date: String
    let explanation: String
    let hdUrl: String?
    let mediaType: String
    let title: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case copyright
        case date
        case explanation
        case hdUrl = "hdurl"
        case mediaType = "media_type"
        case title
        case url
    }
}

extension ApodDto {
    func toDomain() async throws -> Apod {
        guard
            let url = URL(string: self.url),
            let date = self.date.toDate()
        else {
            throw MappingError.invalidDto
        }
        
        return Apod(
            url: url,
            title: self.title,
            date: date,
            explanation: self.explanation,
            mediaType: Apod.MediaType(rawValue: self.mediaType),
            copyright: self.copyright,
            hdURL: URL(string: self.hdUrl ?? "")
        )
    }
}

enum MappingError: Error {
    case invalidDto
}
