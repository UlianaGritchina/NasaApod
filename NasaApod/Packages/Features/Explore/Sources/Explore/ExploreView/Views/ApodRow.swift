//
//  ApodRow.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import DesignSystem
import SwiftUI
import NasaModels

struct ApodRow: View {
    let apod: Apod
    var body: some View {
        VStack {
            AsyncImage(url: apod.url) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            HStack(alignment: .top) {
                Text(apod.title)
                    .font(.headline)
                Spacer()
                Text(apod.date.toString(format: .full))
                    .font(.subheadline)
            }
        }
        .padding(Spacing.xs)
        .background(DSColor.cardBackground)
        .cornerRadius(8)
    }
}

//#Preview {
//    ApodRow(apod: )
//}
