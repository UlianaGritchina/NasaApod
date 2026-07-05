//
//  ApodInfoView.swift
//  APOD
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import DesignSystem
import SwiftUI

struct ApodInfoView: View {
    let apod: Apod
    let imageData: Data?
    
    var body: some View {
        VStack(alignment: .leading) {
            header
            imageView
            copyright
            explanation
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
        ),
        imageData: nil
    )
}

extension ApodInfoView {
    
    private var header: some View {
        Text(apod.title)
            .font(.appSubTitle)
    }
    
    @ViewBuilder
    private var imageView: some View {
        if let imageData,
           let platformImage = PlatformImage(data: imageData) {
            Image(platformImage: platformImage)
                .resizable()
                .frame(height: 350)
                .cornerRadius(12)
        } else {
            Rectangle()
                .frame(height: 350)
                .opacity(0)
                .background(.ultraThinMaterial)
                .cornerRadius(12)
        }
    }
    
    @ViewBuilder
    private var copyright: some View {
        if let copyright = apod.copyright {
            Text("© \(copyright)")
                .font(.appCaption)
        }
    }
    
    private var explanation: some View {
        Text(apod.explanation)
            .font(.appBody)
            .padding(.top, 5)
    }
}
