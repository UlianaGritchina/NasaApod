//
//  ExploreView.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import DesignSystem
import SwiftUI

public struct ExploreView: View {
    
    var viewModel: ExploreViewViewModel
    
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
                if !viewModel.apods.isEmpty {
                    ForEach(viewModel.apods, id: \.date) { apod in
                        ApodRow(apod: apod)
                            .task {
                                await viewModel.loadNextPageIfNeeded(
                                    currentItem: apod
                                )
                            }
                    }
                } else {
                    ProgressView()
                }
            }
            .padding([.horizontal, .bottom], Spacing.md)
            .padding(.top, Spacing.xxs)
        }
    }
}
