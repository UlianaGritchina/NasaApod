//
//  ExploreViewViewModel.swift
//  Explore
//
//  Created by Ульяна Гритчина on 08.07.2026.
//

import ApodDomain
import ExploreDomain
import Foundation

@Observable
public final class ExploreViewViewModel {

    var apods: [Apod] = []

    private let repository: ExploreRepository

    private var isLoading = false
    private var hasMore = true
    private var countForPage = 5

    public init(exploreRepository: ExploreRepository) {
        self.repository = exploreRepository
    }
    
    var isShowApods: Bool {
        !apods.isEmpty
    }

    @MainActor
    func fetchApods() async {
        guard apods.isEmpty else { return }
        do {
            apods = try repository.fetchCachedApods()
        } catch {
            print(error)
        }
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
            let newApods = try await repository.fetchApods(count: countForPage)

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
