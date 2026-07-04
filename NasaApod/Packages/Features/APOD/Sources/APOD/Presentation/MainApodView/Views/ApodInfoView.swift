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
            Text(apod.title)
                .font(.appSubTitle)
            
            imageView
            
            if let copyright = apod.copyright {
                Text("© \(copyright)")
                    .font(.appCaption)
            }
            
            Text(apod.explanation)
                .font(.appBody)
                .padding(.top, 5)
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
    @ViewBuilder
    private var imageView: some View {
        if let imageData,
           let platformImage = PlatformImage(data: imageData) {
#if os(iOS)
            Image(uiImage: platformImage)
                .resizable()
                .frame(height: 350)
                .cornerRadius(12)
#elseif os(macOS)
            Image(nsImage: platformImage)
                .resizable()
                .frame(height: 350)
                .cornerRadius(12)
#endif
        } else {
            Rectangle()
                .frame(height: 350)
                .opacity(0)
                .background(.ultraThinMaterial)
                .cornerRadius(12)
        }
    }
}

#if os(iOS)
import UIKit
typealias PlatformImage = UIImage
#elseif os(macOS)
import AppKit
typealias PlatformImage = NSImage
#endif
