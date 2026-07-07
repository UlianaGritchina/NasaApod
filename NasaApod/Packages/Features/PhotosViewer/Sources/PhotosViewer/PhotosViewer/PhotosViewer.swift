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
    
    var viewModel: PhotosViewerViewModel
    
    public init(_ photos: [Photo], title: String? = nil) {
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
            switch viewModel.photos[viewModel.index] {
            case .data(let data):
                ShareLink(
                    item: Image(uiImage: UIImage(data: data)!),
                    preview: SharePreview(viewModel.navigationTitle, image: Image(uiImage:  UIImage(data: data)!))
                ) {
                    Image(systemName: "square.and.arrow.up")
                }
            case .url(_):
                Text("")
            }
        }
    }
    
    private var photosTabView: some View {
        @Bindable var vm = viewModel
        return TabView(selection: $vm.index) {
            ForEach(viewModel.photos) { photo in
                ZoomableImageView(image: photo)
                    .tag(photo.id)
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(.page)
    }
}
