//
//  Apod.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 26.06.2026.
//

import Foundation

public struct Apod: Equatable, Sendable {
    public let url: URL
    public let title: String
    public let date: Date
    public let explanation: String
    public let mediaType: MediaType
    public let copyright: String?
    public let hdURL: URL?
    
    public init(
        url: URL,
        title: String,
        date: Date,
        explanation: String,
        mediaType: MediaType,
        copyright: String?,
        hdURL: URL?
    ) {
        self.url = url
        self.title = title
        self.date = date
        self.explanation = explanation
        self.mediaType = mediaType
        self.copyright = copyright
        self.hdURL = hdURL
    }
    
    public enum MediaType: String, Sendable {
        case image
        case video
        case unknown
        
        public init(rawValue: String) {
            switch rawValue.lowercased() {
            case "image": self = .image
            case "video": self = .video
            default: self = .unknown
            }
        }
    }
}
