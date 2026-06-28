//
//  NASA_APODApp.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 23.06.2026.
//

import SwiftUI
import SwiftData

@main
struct NASA_APODApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}

final class AppContainer {
    
    let networkClient: NetworkClient
    let apodAPI: ApodAPI
    let apodRepository: ApodRepository
    
    init() {
        self.networkClient = NetworkClient(
            baseURL: URL(string: NasaApiConfig.baseURL.rawValue)!,
            apiKey: NasaApiConfig.apiKey.rawValue
        )
        self.apodAPI = ApodAPIImpl(client: networkClient)
        self.apodRepository = ApodRepositoryImpl(apodApi: apodAPI)
    }
}
