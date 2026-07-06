//
//  ZoomableImageViewModel.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 06.07.2026.
//

import SwiftUI
import Observation

@MainActor
@Observable
final class ZoomableImageViewModel {
    
    let minScale: CGFloat = 1
    let maxScale: CGFloat = 4
    
    var scale: CGFloat = 1
    var lastScale: CGFloat = 1
    
    var offset: CGSize = .zero
    var lastOffset: CGSize = .zero
    
    var image: Photo
    
    init(image: Photo) {
        self.image = image
    }
    
    func magnifyChanged(value: CGFloat, viewSize: CGSize) {
        let newScale = min(max(minScale, lastScale * value), maxScale)
        let ratio = newScale / scale
        
        scale = newScale
        
        offset = CGSize(
            width: offset.width * ratio,
            height: offset.height * ratio
        )
        
        offset = limitedOffset(offset, in: viewSize)
    }
    
    func magnifyEnded(viewSize: CGSize) {
        lastScale = scale
        guard scale > minScale else {
            reset()
            return
        }
        offset = limitedOffset(offset, in: viewSize)
        lastOffset = offset
    }
    
    func dragChanged(translation: CGSize, viewSize: CGSize) {
        guard scale > minScale else { return }
        
        let proposed = CGSize(
            width: lastOffset.width + translation.width,
            height: lastOffset.height + translation.height
        )
        
        offset = limitedOffset(proposed, in: viewSize)
    }
    
    func dragEnded() {
        lastOffset = offset
    }
    
    func doubleTap() {
        if scale > minScale {
            reset()
        } else {
            scale = 2.5
            lastScale = 2.5
        }
    }
    
    private func limitedOffset(_ proposed: CGSize, in size: CGSize) -> CGSize {
        guard scale > 1 else {
            return .zero
        }
        
        let maxX = (size.width * scale - size.width) / 2
        let maxY = (size.height * scale - size.height) / 2
        
        return CGSize(
            width: proposed.width.clamped(to: -maxX...maxX),
            height: proposed.height.clamped(to: -maxY...maxY)
        )
    }
    
    func magnificationChanged(_ value: CGFloat, viewSize: CGSize) {
        let newScale = (lastScale * value)
            .clamped(to: minScale...maxScale)
        
        let progress = (newScale - minScale) / (maxScale - minScale)
        
        scale = newScale
        offset = CGSize(
            width: lastOffset.width * progress,
            height: lastOffset.height * progress
        )
        offset = limitedOffset(offset, in: viewSize)
    }
    
    func magnificationEnded(viewSize: CGSize) {
        lastScale = scale
        withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
            if scale <= minScale {
                reset()
            } else {
                offset = limitedOffset(offset, in: viewSize)
                lastOffset = offset
            }
        }
    }
    
    func dragChanged(_ translation: CGSize, viewSize: CGSize) {
        guard scale > minScale else { return }
        let proposed = CGSize(
            width: lastOffset.width + translation.width,
            height: lastOffset.height + translation.height
        )
        offset = limitedOffset(proposed, in: viewSize)
    }
    
    func toggleZoom() {
        if scale > minScale {
            reset()
        } else {
            scale = 2.5
            lastScale = 2.5
        }
    }
    
    func reset() {
        scale = minScale
        lastScale = minScale
        offset = .zero
        lastOffset = .zero
    }
}
