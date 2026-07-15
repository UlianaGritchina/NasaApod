//
//  ApodViewModel.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 24.06.2026.
//

import ApodDomain
import Foundation

@Observable
public final class MainApodViewModel {
    let datePickerRange = ...Date()
    
    var apod: Apod?
    var apodImageData: Data?
    var selectedDate = Date()
    var viewState: MainApodViewState = .loading
    
    private let repository: ApodRepository
    
    public init(repository: ApodRepository) {
        self.repository = repository
    }
    
    var selectedDateString: String {
        selectedDate.toString(format: .full)
    }
    
    @MainActor
    func fetchApodInfo() async {
        guard isNeedToUpdateApod else { return }
        viewState = .loading
        do {
            let apod = try await repository.getApod(for: selectedDate)
            self.apod = apod
            viewState = .loaded(apod: apod)
            try? await fetchApodImageData(url: apod.url)
        } catch {
            viewState = .error
        }
    }

    @MainActor
    private func fetchApodImageData(url: URL) async throws {
        apodImageData = nil
        apodImageData = try await repository.getApodImageData(
            for: url,
            date: selectedDate
        )
    }
    
    private var isNeedToUpdateApod: Bool {
        !(apod?.date.isSameDay(as: selectedDate) ?? false)
    }
}

