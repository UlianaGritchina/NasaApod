//
//  ExploreViewViewModel.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import Core
import Foundation
import NasaModels

@Observable
public final class ExploreViewViewModel {
    var apods: [Apod]?
    
    private let repository: ExploreRepository
    
    public init(exploreRepository: ExploreRepository) {
        self.repository = exploreRepository
    }
    
    @MainActor
    func fetchApods() async {
        guard apods == nil else { return }
        do {
            let apods = try await repository.fetchApods(count: 5)
            self.apods = apods
        } catch {
            
        }
    }
}
