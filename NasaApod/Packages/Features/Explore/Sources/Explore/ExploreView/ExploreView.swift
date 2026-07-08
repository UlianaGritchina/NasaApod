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
            ScrollView(showsIndicators: false) {
                VStack {
                    if let apods = viewModel.apods {
                        ForEach(apods, id: \.date) { apod in
                            ApodRow(apod: apod)
                        }
                    } else {
                        ProgressView()
                    }
                }
                .padding([.horizontal, .bottom], Spacing.md)
                .padding(.top, Spacing.xxs)
            }
            .navigationTitle("Explore")
            .background(DSColor.background)
            .task {
                await viewModel.fetchApods()
            }
        }
    }
}

//#Preview {
//    ExploreView(viewModel: ExploreViewViewModel(exploreRepository: E))
//}
