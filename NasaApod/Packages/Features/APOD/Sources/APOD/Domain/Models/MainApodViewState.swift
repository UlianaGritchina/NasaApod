//
//  MainApodViewState.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

enum MainApodViewState: Equatable {
    case loading
    case loaded(apod: Apod)
    case error
}
