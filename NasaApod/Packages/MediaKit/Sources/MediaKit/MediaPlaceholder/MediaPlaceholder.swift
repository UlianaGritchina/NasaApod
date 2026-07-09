//
//  MediaPlaceholder.swift
//  MediaKit
//
//  Created by Ульяна Гритчина on 09.07.2026.
//

import SwiftUI

public struct MediaPlaceholder: View {
    public init() { }
    
    public var body: some View {
        Rectangle()
            .foregroundStyle(.secondary)
            .opacity(0.5)
            .frame(height: 250)
            .cornerRadius(8)
            .overlay {
                ProgressView()
            }
    }
}

#Preview {
    MediaPlaceholder()
}
