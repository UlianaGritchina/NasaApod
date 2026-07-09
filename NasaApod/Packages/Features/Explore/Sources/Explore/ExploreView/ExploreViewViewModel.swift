//
//  ExploreViewViewModel.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import Core
import Foundation
import NasaModels

import Core
import Foundation
import NasaModels

@Observable
public final class ExploreViewViewModel {

    var apods: [Apod] = []

    private let repository: ExploreRepository

    private var isLoading = false
    private var hasMore = true

    public init(exploreRepository: ExploreRepository) {
        self.repository = exploreRepository
    }

    @MainActor
    func fetchApods() async {
        guard apods.isEmpty else { return }
        await loadNextPage()
    }

    @MainActor
    func loadNextPageIfNeeded(currentItem: Apod) async {
        guard currentItem == apods.last else { return }
        await loadNextPage()
    }

    @MainActor
    private func loadNextPage() async {
        guard !isLoading, hasMore else { return }

        isLoading = true
        defer { isLoading = false }

        do {
            let newApods = try await repository.fetchApods(count: 5)

            guard !newApods.isEmpty else {
                hasMore = false
                return
            }

            apods.append(contentsOf: newApods)
        } catch {
            print(error)
        }
    }
}
