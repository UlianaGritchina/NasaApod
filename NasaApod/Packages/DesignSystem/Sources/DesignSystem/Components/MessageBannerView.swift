//
//  NotificationMessageView.swift
//  DesignSystem
//
//  Created by Ульяна Гритчина on 02.07.2026.
//

import SwiftUI

public struct MessageBannerView: View {
    let message: String
    let systemImageName: String
    let imageColor: Color
    
    public init(message: String, systemImageName: String, imageColor: Color) {
        self.message = message
        self.systemImageName = systemImageName
        self.imageColor = imageColor
    }
    
    public var body: some View {
        if #available(iOS 26.0, *) {
            baseView
                .glassEffect()
        } else {
            baseView
        }
    }
}

#Preview {
    MessageBannerView(
        message: "Hi, my name is...",
        systemImageName: "tennisball.fill",
        imageColor: .green
    )
}

extension MessageBannerView {
    private var baseView: some View {
        HStack(spacing: 5) {
            Image(systemName: systemImageName)
                .foregroundStyle(imageColor)
                .font(.headline)
            
            Text(message)
        }
        .padding()
        .background {
            Rectangle()
                .foregroundStyle(.background)
        }
        .clipShape(.capsule)
        .shadow(color: .secondary.opacity(0.3),radius: 4)
    }
}
