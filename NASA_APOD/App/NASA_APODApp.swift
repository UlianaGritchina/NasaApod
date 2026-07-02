//
//  NASA_APODApp.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 23.06.2026.
//

import Core
import SwiftUI
import SwiftData

@main
struct NASA_APODApp: App {
    
    private let container = DependencyContainer()
    private let environment = EnvironmentLoader.load()
    private let networkMonitor: NetworkMonitor?
    
    init() {
        AppAssembly.register(in: container, environment: environment)
        networkMonitor = try? container.resolve(NetworkMonitor.self)
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView(container: container)
        }
    }
}
