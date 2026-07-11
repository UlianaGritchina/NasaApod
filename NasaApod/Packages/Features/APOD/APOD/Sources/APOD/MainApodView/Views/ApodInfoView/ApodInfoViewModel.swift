//
//  File.swift
//  APOD
//
//  Created by Ульяна Гритчина on 07.07.2026.
//

import Foundation
import ApodData
import ApodDomain

@Observable
final class ApodInfoViewModel {
    let apod: Apod
    let imageData: Data?
    
    var isOpenImageViewer = false
    
    init(apod: Apod, imageData: Data?) {
        self.apod = apod
        self.imageData = imageData
    }
    
    var title: String {
        apod.title
    }
    
    var copyright: String? {
        apod.copyright
    }
    
    var explanation: String {
        apod.explanation
    }
    
    var mediaType: Apod.MediaType {
        apod.mediaType
    }
    
    var videoUrl: URL {
        apod.url
    }
    
    func openPhotosViewer() {
        isOpenImageViewer = true
    }
}
