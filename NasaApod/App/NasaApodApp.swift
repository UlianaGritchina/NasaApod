//
//  NasaApodApp.swift
//  NasaApodApp
//
//  Created by Ульяна Гритчина on 23.06.2026.
//

import APOD
import Core
import DependencyInjection
import Explore
import MainTabView
import SwiftUI

@main
struct NasaApodApp: App {

    private let container = DependencyContainer()
    private let environment = EnvironmentLoader.load()

    init() {
        AppAssembly.register(in: container, environment: environment)
    }

    var body: some Scene {
        WindowGroup {
            let vm = MainTabViewViewModel(
                apodRepository: try! container.resolve(ApodRepository.self),
                exploreRepository: try! container.resolve(ExploreRepository.self),
                networkMonitor: try? container.resolve(NetworkMonitor.self)
            )

            MainTabView(viewModel: vm)
        }
    }
}
