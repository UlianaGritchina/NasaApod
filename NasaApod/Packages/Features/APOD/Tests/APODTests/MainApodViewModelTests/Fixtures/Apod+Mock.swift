//
//  Apod+Mock.swift
//  APOD
//
//  Created by Ульяна Гритчина on 01.07.2026.
//

import ApodDomain
import Foundation
@testable import APOD

extension Apod {
    static var mock: Apod {
        Apod(
            url: URL(string: "https://apod.nasa.gov/apod/image/2606/AR4478_vidal_960.jpg")!,
            title: "title",
            date: Date(),
            explanation: "explanation",
            mediaType: .image,
            copyright: nil,
            hdURL: nil
        )
    }
}
