//
//  ApodDetailView.swift
//  ApodDetail
//
//  Created by Ульяна Гритчина on 12.07.2026.
//

import ApodDomain
import SwiftUI

public struct ApodDetailView: View {
    var viewModel: ApodDetailViewModel
    
    public init(apod: Apod) {
       viewModel = ApodDetailViewModel(apod: apod)
    }
    public var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.explanation)
            }
            .padding(.horizontal)
        }
        .navigationTitle(viewModel.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
