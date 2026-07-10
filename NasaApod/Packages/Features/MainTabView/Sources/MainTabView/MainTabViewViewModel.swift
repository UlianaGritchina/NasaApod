//
//  MainTabViewViewModel.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 02.07.2026.
//

import APOD
import ApodDomain
import Core
import Explore
import Foundation

@MainActor
@Observable
public final class MainTabViewViewModel {
    
    private let networkMonitor: NetworkMonitor?
    
    let mainApodViewModel: MainApodViewModel
    let exploreViewModel: ExploreViewViewModel
    
    var isLostConnection = false
    
    public init(
        apodRepository: ApodRepository,
        exploreRepository: ExploreRepository,
        networkMonitor: NetworkMonitor?
    ) {
        self.mainApodViewModel = MainApodViewModel(repository: apodRepository)
        self.exploreViewModel = ExploreViewViewModel(exploreRepository: exploreRepository)
        self.networkMonitor = networkMonitor
    }
    
    func startNetworkMonitoring() async {
        guard let networkMonitor else { return }
        for await status in networkMonitor.statusUpdates {
            await MainActor.run {
                isLostConnection = !status.isConnected
            }
            
            if isLostConnection {
                Task {
                    try? await Task.sleep(for: .seconds(5))
                    await MainActor.run {
                        isLostConnection = false
                    }
                }
            }
        }
    }
}
