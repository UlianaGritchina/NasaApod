//
//  PhotosViewer.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 06.07.2026.
//

import DesignSystem
import SwiftUI

public struct PhotosViewer: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var viewModel: PhotosViewerViewModel
    
    public init(_ photos: [Data], title: String? = nil) {
        viewModel = PhotosViewerViewModel(photos: photos, title: title)
    }
    
    public var body: some View {
        NavigationStack {
            photosTabView
                .tabViewStyle(.page)
                .navigationTitle(viewModel.navigationTitle)
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    dismissButton
                    shareButton
                }
                .background(DSColor.background)
        }
    }
}

extension PhotosViewer {
    private var dismissButton: some ToolbarContent {
        ToolbarItem(placement: .cancellationAction) {
            Button(action: { dismiss() }) {
                Image(systemName: "xmark")
            }
        }
    }
    
    private var shareButton: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            if let shareImageItem {
                ShareLink(
                    item: shareImageItem,
                    preview: SharePreview(
                        viewModel.navigationTitle,
                        image: shareImageItem
                    )
                ) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    }
    
    private var shareImageItem: Image? {
        guard let uiImage = UIImage(data: viewModel.photos[viewModel.index]) else {
            return nil
        }
        return Image(uiImage: uiImage)
    }
    
    private var photosTabView: some View {
        @Bindable var vm = viewModel
        return TabView(selection: $vm.index) {
            ForEach(viewModel.photos, id: \.self) { photo in
                ZoomableImageView(image: photo)
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(.page)
    }
}
