//
//  CachedApod.swift
//  APOD
//
//  Created by Ульяна Гритчина on 07.07.2026.
//

import Foundation

struct CachedApod: Codable {
    let url: URL
    let title: String
    let date: Date
    let explanation: String
    let mediaType: String
    let copyright: String?
    let hdURL: URL?
    let cachedAt: Date
}

extension CachedApod {

    init(apod: Apod) {
        self.url = apod.url
        self.title = apod.title
        self.date = apod.date
        self.explanation = apod.explanation
        self.mediaType = apod.mediaType.rawValue
        self.copyright = apod.copyright
        self.hdURL = apod.hdURL
        self.cachedAt = Date()
    }

    func toDomain() -> Apod {
        Apod(
            url: url,
            title: title,
            date: date,
            explanation: explanation,
            mediaType: Apod.MediaType(rawValue: mediaType),
            copyright: copyright,
            hdURL: hdURL
        )
    }
}
