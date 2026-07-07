//
//  Photo.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 06.07.2026.
//

import Foundation

public enum Photo: Identifiable, Hashable {
    case url(URL)
    case data(Data)

    public var id: UUID { UUID() }
}
