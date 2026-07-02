//
//  MainTabView.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 23.06.2026.
//

import APOD
import Core
import DesignSystem
import SwiftUI

struct MainTabView: View {
    
    let viewModel: MainTabViewViewModel
    
    init(container: DependencyContainer) {
        viewModel = MainTabViewViewModel(container: container)
    }
    
    var body: some View {
        TabView {
            MainApodView(viewModel.mainApodViewModel)
                .tabItem {
                    Label("Apod", systemImage: "moon.stars")
                }
        }
        .overlay(alignment: .top) {
            networkBanner
        }
        .animation(.spring(), value: viewModel.isLostConnection)
        .task {
            await viewModel.startNetworkMonitoring()
        }
    }
}

#Preview {
    MainTabView(container: DependencyContainer())
}

extension MainTabView {
    @ViewBuilder
    private var networkBanner: some View {
        if viewModel.isLostConnection {
            NotificationMessageView(
                message: "Connection lost",
                systemImageName: "wifi.exclamationmark.circle",
                imageColor: .red
            )
            .transition(.move(edge: .top).combined(with: .opacity))
        }
    }
}
