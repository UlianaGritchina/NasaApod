//
//  AppAssembly.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import APOD
import Core
import DependencyInjection
import Foundation

enum AppAssembly {
    static func register(in container: DependencyContainer, environment: AppEnvironment) {
        CoreAssembly.register(in: container, env: environment)
        ApodAssembly.register(in: container)
    }
}

