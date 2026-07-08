//
//  MainTabView.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 23.06.2026.
//

import APOD
import Core
import DesignSystem
import Explore
import SwiftUI

public struct MainTabView: View {
    
    let viewModel: MainTabViewViewModel
    
    public init(viewModel: MainTabViewViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        TabView {
            MainApodView(viewModel.mainApodViewModel)
                .tabItem {
                    Label("Apod", systemImage: "moon.stars")
                }
            
            ExploreView(viewModel: viewModel.exploreViewModel)
                .tabItem {
                    Label("Explore", systemImage: "binoculars")
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
