//
//  File.swift
//  ApodDetail
//
//  Created by Ульяна Гритчина on 12.07.2026.
//

import ApodDomain
import Foundation

final class ApodDetailViewModel {
    let apod: Apod
    
    init(apod: Apod) {
        self.apod = apod
    }
    
    var title: String {
        apod.title
    }
    
    var explanation: String {
        apod.explanation
    }
}
