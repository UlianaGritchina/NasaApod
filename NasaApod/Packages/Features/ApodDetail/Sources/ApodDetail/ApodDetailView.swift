//
//  ApodDetailView.swift
//  ApodDetail
//
//  Created by Ульяна Гритчина on 12.07.2026.
//

import AsyncCacheImage
import ApodDomain
import MediaKit
import DesignSystem
import SwiftUI

public struct ApodDetailView: View {
    @State private var viewModel: ApodDetailViewModel
    
    public init(apod: Apod) {
       viewModel = ApodDetailViewModel(apod: apod)
    }
    
    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                DefaultAsyncCacheImage(url: viewModel.apod.url)
                Text(viewModel.explanation)
            }
            .padding(.horizontal)
        }
        .navigationTitle(viewModel.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
