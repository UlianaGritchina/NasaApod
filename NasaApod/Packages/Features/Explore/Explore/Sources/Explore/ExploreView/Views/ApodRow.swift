//
//  ApodRow.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import AppFoundation
import ApodDomain
import DesignSystem
import MediaKit
import SwiftUI

struct ApodRow: View {
    let apod: Apod
    var body: some View {
        VStack(spacing: Spacing.xxs) {
            mediaContent
            info
        }
        .glassBackground(shape: RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ApodRow(
        apod: Apod(
            url: URL(string: "https://apod.nasa.gov/apod/image/2606/AR4478_vidal_960.jpg")!,
            title: "Moon",
            date: Date(),
            explanation: "",
            mediaType: .image,
            copyright: "Uliana",
            hdURL: nil
        )
    )
}

extension ApodRow {
    @ViewBuilder
    private var mediaContent: some View {
        switch apod.mediaType {
        case .image:
            imageView
        case .video:
            videoView
        case .unknown:
            EmptyView()
        }
    }
    
    private var imageView: some View {
        AppAsyncImage(imageURL: apod.url)
    }
    
    private var videoView: some View {
        WebVideoPlayer(url: apod.url)
            .frame(height: 250)
            .cornerRadius(10)
    }
    
    private var info: some View {
        HStack(alignment: .top) {
            Text(apod.title)
                .font(.headline)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Text(apod.date.toString(format: .full))
                .font(.subheadline)
        }
        .foregroundStyle(DSColor.text)
        .padding([.horizontal, .bottom], Spacing.xxs)
    }
}
