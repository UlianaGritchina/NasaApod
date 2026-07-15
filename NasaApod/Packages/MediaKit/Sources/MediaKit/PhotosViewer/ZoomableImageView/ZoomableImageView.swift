//
//  ZoomableImageView.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 06.07.2026.
//

import SwiftUI

struct ZoomableImageView: UIViewRepresentable {
    let image: Data
    
    func makeUIView(context: Context) -> ZoomableScrollView {
        let scrollView = ZoomableScrollView()
        scrollView.setImage(image)
        return scrollView
    }
    
    func updateUIView(_ uiView: ZoomableScrollView, context: Context) {
        uiView.setImage(image)
    }
}
