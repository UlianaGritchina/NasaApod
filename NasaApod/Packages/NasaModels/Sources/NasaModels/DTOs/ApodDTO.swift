//
//  ApodDTO.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 26.06.2026.
//

import AppFoundation
import Foundation

public struct ApodDTO: Decodable {
    let copyright: String?
    let stringDate: String
    let explanation: String
    let hdUrl: String?
    let mediaType: String
    let title: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case copyright
        case stringDate = "date"
        case explanation
        case hdUrl = "hdurl"
        case mediaType = "media_type"
        case title
        case url
    }
}

extension ApodDTO {
    public func toDomain() throws -> Apod {
        guard
            let url = URL(string: self.url),
            let date = self.stringDate.toDate()
        else {
            throw MappingError.invalidDTO
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
    case invalidDTO
}
