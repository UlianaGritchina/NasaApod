//
//  NASA_APODApp.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 23.06.2026.
//

import APOD
import Core
import SwiftUI
import SwiftData

@main
struct NASA_APODApp: App {

    private let container = DependencyContainer()
    private let environment = EnvironmentLoader.load()

    init() {
        AppAssembly.register(in: container, environment: environment)
    }

    var body: some Scene {
        WindowGroup {
            let vm = MainTabViewViewModel(
                apodRepository: try! container.resolve(ApodRepository.self),
                networkMonitor: try? container.resolve(NetworkMonitor.self)
            )

            MainTabView(viewModel: vm)
        }
    }
}
