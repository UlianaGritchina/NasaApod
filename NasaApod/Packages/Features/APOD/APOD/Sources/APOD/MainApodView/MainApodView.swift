//
//  ApodView.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 24.06.2026.
//

import ApodData
import DesignSystem
import SwiftUI

public struct MainApodView: View {
    private var viewModel: MainApodViewModel
    
    public init(_ viewModel: MainApodViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: Spacing.sm) {
                    datePicker
                    apodContent
                }
                .padding(.horizontal, Spacing.md)
                .animation(.easeInOut, value: viewModel.viewState)
            }
            .navigationTitle("APOD")
            .background(DSColor.background)
            .task {
                await viewModel.fetchApodInfo()
            }
            .onChange(of: viewModel.selectedDate) {
                Task {
                    await viewModel.fetchApodInfo()
                }
            }
        }
    }
}

#Preview {
    MainApodView(MainApodViewModel(repository: MockApodRepository()))
}

extension MainApodView {
    private var datePicker: some View {
        @Bindable var bindableVM = viewModel
        return DatePicker(
            "Astronomy Picture of the Day:",
            selection: $bindableVM.selectedDate,
            in: viewModel.datePickerRange,
            displayedComponents: [.date]
        )
        .font(.appDate)
        .lineLimit(1)
        .minimumScaleFactor(0.1)
    }
    
    @ViewBuilder
    private var apodContent: some View {
        switch viewModel.viewState {
        case .loading:
            ProgressView()
            
        case .loaded(let apod):
            ApodInfoView(apod: apod)
                .id(apod.title)
                .transition(.opacity)
            
            
        case .error:
            Text("try again later")
        }
    }
}
