//
//  Apod.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 26.06.2026.
//

import Foundation

struct Apod {
    let url: URL
    let title: String
    let date: Date
    let explanation: String
    let mediaType: MediaType
    let copyright: String?
    let hdURL: URL?
    
    enum MediaType: String {
        case image
        case video
        case unknown
        
        init(rawValue: String) {
            switch rawValue.lowercased() {
            case "image": self = .image
            case "video": self = .video
            default: self = .unknown
            }
        }
    }
}
