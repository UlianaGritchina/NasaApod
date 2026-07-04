//
//  MainTabView.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 23.06.2026.
//

import APOD
import Core
import DesignSystem
import SwiftUI

struct MainTabView: View {
    
    let viewModel: MainTabViewViewModel
    
    init(viewModel: MainTabViewViewModel) {
        self.viewModel = viewModel
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

extension MainTabView {
    @ViewBuilder
    private var networkBanner: some View {
        if viewModel.isLostConnection {
            MessageBannerView(
                message: "Connection lost",
                systemImageName: "wifi.exclamationmark.circle",
                imageColor: .red
            )
            .transition(.move(edge: .top).combined(with: .opacity))
        }
    }
}
