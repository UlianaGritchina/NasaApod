//
//  ZoomableScrollView.swift
//  PhotosViewer
//
//  Created by Ульяна Гритчина on 06.07.2026.
//

import UIKit

final class ZoomableScrollView: UIScrollView {
    
    private let imageView = UIImageView()
    
    private var currentImage: UIImage? {
        didSet {
            imageView.image = currentImage
            configureImage()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        delegate = self
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        bouncesZoom = true
        bounces = true
        
        minimumZoomScale = 1
        maximumZoomScale = 4
        
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        addSubview(imageView)
        
        let doubleTap = UITapGestureRecognizer(
            target: self,
            action: #selector(handleDoubleTap(_:))
        )
        
        doubleTap.numberOfTapsRequired = 2
        
        addGestureRecognizer(doubleTap)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if zoomScale == minimumZoomScale {
            configureImage()
        }
        
        centerImage()
    }
    
    func setImage(_ photo: Data) {
        currentImage = UIImage(data: photo)
    }
    
    private func configureImage() {
        guard let image = currentImage else { return }
        
        let imageSize = image.size
        let boundsSize = bounds.size
        
        let widthScale = boundsSize.width / imageSize.width
        let heightScale = boundsSize.height / imageSize.height
        
        let minScale = min(widthScale, heightScale)
        
        minimumZoomScale = minScale
        maximumZoomScale = max(minScale * 4, 4)
        
        zoomScale = minimumZoomScale
        
        let fittedSize = CGSize(
            width: imageSize.width * minScale,
            height: imageSize.height * minScale
        )
        
        imageView.frame = CGRect(origin: .zero, size: fittedSize)
        
        contentSize = fittedSize
        centerImage()
    }
    
    private func centerImage() {
        
        var frame = imageView.frame
        
        frame.origin.x = frame.width < bounds.width
        ? (bounds.width - frame.width) / 2
        : 0
        
        frame.origin.y = frame.height < bounds.height
        ? (bounds.height - frame.height) / 2
        : 0
        
        imageView.frame = frame
    }
    
    @objc
    private func handleDoubleTap(_ gesture: UITapGestureRecognizer) {
        
        if zoomScale > minimumZoomScale {
            setZoomScale(minimumZoomScale, animated: true)
            return
        }
        
        let point = gesture.location(in: imageView)
        
        let zoomScale = min(maximumZoomScale, minimumZoomScale * 2.5)
        
        let width = bounds.width / zoomScale
        let height = bounds.height / zoomScale
        
        let rect = CGRect(
            x: point.x - width / 2,
            y: point.y - height / 2,
            width: width,
            height: height
        )
        
        zoom(to: rect, animated: true)
    }
}

extension ZoomableScrollView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }
}
