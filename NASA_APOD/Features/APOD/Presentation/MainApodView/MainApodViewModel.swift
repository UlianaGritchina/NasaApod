//
//  ApodViewModel.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 24.06.2026.
//

import Foundation


    @MainActor
    @Observable
    final class MainApodViewModel {
        private let repository: ApodRepository
        
        var apod: Apod?
        var viewState: MainApodViewState = .loading
        
        init(repository: ApodRepository) {
            self.repository = repository
            fetchApod()
        }
        
        private func fetchApod() {
            Task {
                do {
                    apod = try await repository.getTodayApod()
                    guard let apod else {
                        viewState = .error
                        return
                    }
                    viewState = .loaded(apod: apod)
                } catch {
                    viewState = .error
                }
            }
        }
    }

