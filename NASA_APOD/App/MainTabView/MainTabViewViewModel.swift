//
//  MainTabViewViewModel.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 02.07.2026.
//

import APOD
import Core
import Foundation

@MainActor
@Observable
final class MainTabViewViewModel {
    
    private let networkMonitor: NetworkMonitor?
    
    let container: DependencyContainer
    
    var mainApodViewModel: MainApodViewModel
    var isLostConnection = false
    
    init(container: DependencyContainer) {
        self.container = container
        
        mainApodViewModel = MainApodViewModel(
            repository: try! container.resolve(ApodRepository.self)
        )
        
        networkMonitor = try? container.resolve(NetworkMonitor.self)
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
