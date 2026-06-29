//
//  ApodAssembly.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

import Core
import APOD
import Foundation

enum ApodAssembly {
    static func register(in container: DependencyContainer) {
        
        container.register(ApodAPI.self) {
            ApodAPIImpl(
                client: try! container.resolve(NetworkClientProtocol.self)
            )
        }
        
        container.register(ApodRepository.self) {
            ApodRepositoryImpl(
                apodApi: try! container.resolve(ApodAPI.self)
            )
        }
    }
}
