//
//  ApodInfoView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import ApodDomain
import AsyncCacheImage
import DesignSystem
import MediaKit
import SwiftUI

struct ApodInfoView: View {
    private var viewModel: ApodInfoViewModel
    
    init(apod: Apod) {
        viewModel = ApodInfoViewModel(apod: apod)
    }
    
    var body: some View {
        @Bindable var vm = viewModel
        VStack(alignment: .leading) {
            header
            mediaContent
            copyright
            explanation
        }
        .fullScreenCover(isPresented: $vm.isOpenImageViewer) {
            if let imageData = viewModel.imageData {
                PhotosViewer([imageData], title: viewModel.title)
            }
        }
    }
}

#Preview {
    ApodInfoView(
        apod: Apod(
            url: URL(string: "https://apod.nasa.gov/apod/image/2606/AR4478_vidal_960.jpg")!,
            title: "Moon",
            date: Date(),
            explanation: "afjldkjf afj ajfl kajsldfjajsdlfjaskdjflkjl  alkfjsld f flakjfl",
            mediaType: .image,
            copyright: "Uliana",
            hdURL: nil
        )
    )
}

extension ApodInfoView {
    private var header: some View {
        Text(viewModel.title)
            .font(.appSubTitle)
    }
    
    @ViewBuilder
    private var mediaContent: some View {
        switch viewModel.mediaType {
        case .image: imageView
        case .video: videoView
        default:
            EmptyView()
        }
    }
    
    private var imageView: some View {
        AsyncCacheImage(url: viewModel.apod.url) { image, data in
            image
                .resizable()
                .frame(height: 250)
                .cornerRadius(10)
                .onAppear {
                    viewModel.imageData = data
                }
        }
        .onTapGesture { viewModel.openPhotosViewer() }
    }
    
    private var videoView: some View {
        VStack {
            WebVideoPlayer(url: viewModel.videoUrl)
                .frame(height: 250)
                .cornerRadius(10)
        }
    }
    
    @ViewBuilder
    private var copyright: some View {
        if let copyright = viewModel.copyright {
            Text("© \(copyright)")
                .font(.appCaption)
        }
    }
    
    private var explanation: some View {
        Text(viewModel.explanation)
            .font(.appBody)
            .padding(.top, Spacing.xxs)
    }
}
