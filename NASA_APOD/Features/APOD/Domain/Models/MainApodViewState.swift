//
//  MainApodViewState.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 28.06.2026.
//

import Foundation

enum MainApodViewState {
    case loading
    case loaded(apod: Apod)
    case error
}
