//
//  MainTabView.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 23.06.2026.
//

import SwiftUI

struct MainTabView: View {
    let container = AppContainer()
    
    var body: some View {
        TabView {
            MainApodView(
                MainApodView.ViewModel(repository: container.apodRepository)
            )
            .tabItem {
                Label("Apod", systemImage: "moon.stars")
            }
        }
    }
}

#Preview {
    MainTabView()
}
