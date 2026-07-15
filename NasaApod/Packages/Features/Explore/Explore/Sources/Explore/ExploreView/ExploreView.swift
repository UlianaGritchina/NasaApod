//
//  ExploreView.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import ApodDetail
import DesignSystem
import SwiftUI

public struct ExploreView: View {
    @State private var viewModel: ExploreViewViewModel
    
    public init(viewModel: ExploreViewViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack {
            ZStack {
                background
                apodsScroll
            }
            .navigationTitle("Explore")
            .task {
                await viewModel.fetchApods()
            }
        }
    }
}

extension ExploreView {
    private var background: some View {
        DSColor.background
            .ignoresSafeArea()
    }
    
    private var apodsScroll: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: Spacing.xs) {
                if viewModel.isShowApods {
                    ForEach(viewModel.apods, id: \.date) { apod in
                        NavigationLink(destination: ApodDetailView(apod: apod)) {
                            ApodRow(apod: apod)
                                .task {
                                    await viewModel.loadNextPageIfNeeded(
                                        currentItem: apod
                                    )
                                }
                        }
                    }
                } else {
                    ProgressView()
                }
            }
            .padding(.horizontal, Spacing.xs)
            .padding(.top, Spacing.xxs)
            .padding(.bottom, Spacing.md)
        }
    }
}
