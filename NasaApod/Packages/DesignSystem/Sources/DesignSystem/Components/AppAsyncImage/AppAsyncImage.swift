//
//  AppAsyncImage.swift
//  DesignSystem
//
//  Created by Ульяна Гритчина on 13.07.2026.
//

import Core
import SwiftUI

enum LoadingState {
    case loading
    case loaded(imageData: Data)
    case error
}

@Observable
final class AppAsyncImageViewModel {
    private let networkClient = NetworkClientImpl(
        baseURL: URL(string: "https://api.nasa.gov")!,
        apiKey: "oWsYmdEdqaHzl1gwxBgU8V8Y8rLak8sFZgfgsH4W"
    )
    
    private let cacheService = try! CacheServiceImpl()
    
    private let url: URL
    
    var loadingState: LoadingState = .loading
    
    init(url: URL) {
        self.url = url
    }
    
    @MainActor
    func loadImageData() async {
        if let cachedImageData = try? cacheService.get(url.absoluteString, as: Data.self) {
            loadingState = .loaded(imageData: cachedImageData)
        } else {
            do {
                let imageData = try await networkClient.download(from: url)
                loadingState = .loaded(imageData: imageData)
                cache(imageData)
            } catch {
                loadingState = .error
            }
        }
    }
    
    private func cache(_ data: Data) {
        try? cacheService.save(data, for: url.absoluteString)
    }
}

public struct AppAsyncImage: View {
    @State private var viewModel: AppAsyncImageViewModel
    
    public init(imageURL: URL) {
        viewModel = AppAsyncImageViewModel(url: imageURL)
    }
    
    public var body: some View {
        imageContent
            .task {
                await viewModel.loadImageData()
            }
    }
}

#Preview {
    AppAsyncImage(imageURL: URL(string: "https://apod.nasa.gov/apod/image/2606/AR4478_vidal_960.jpg")!)
}

extension AppAsyncImage {
    
    @ViewBuilder
    private var imageContent: some View {
        switch viewModel.loadingState {
        case .loading:
            placeholder
        case .loaded(let imageData):
            if let platformImage = PlatformImage(data: imageData) {
                Image(platformImage: platformImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .transition(.opacity)
            }
        case .error:
            placeholder
        }
    }
    
    private var placeholder: some View {
        Rectangle()
            .foregroundStyle(DSColor.secondaryGray)
            .opacity(0.5)
            .frame(height: 250)
            .cornerRadius(8)
            .overlay {
                ProgressView()
            }
    }
}
