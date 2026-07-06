//
//  PhotosViewerViewModel.swift
//  PhotosViewer
//
//  Created by Ульяна Гритчина on 06.07.2026.
//

import Foundation

@MainActor
@Observable
final class PhotosViewerViewModel {
    let photos: [Photo]
    let title: String?
    
    var index = 0
    
    init(photos: [Photo], title: String?) {
        self.photos = photos
        self.title = title
    }
    
    var currentPhoto: Photo {
        photos[index]
    }
    
    var navigationTitle: String {
        title ?? ""
    }
}
