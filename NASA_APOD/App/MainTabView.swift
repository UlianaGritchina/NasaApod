//
//  MainTabView.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 23.06.2026.
//


import SwiftUI

struct MainTabView: View {
    
    let container: DependencyContainer
    
    private var viewModel: MainApodViewModel
    
    init(container: DependencyContainer) {
        self.container = container
        
        viewModel = MainApodViewModel(
            repository: try! container.resolve(ApodRepository.self)
        )
    }
    
    var body: some View {
        TabView {
            MainApodView(viewModel)
                .tabItem {
                    Label("Apod", systemImage: "moon.stars")
                }
        }
    }
}

//#Preview {
//    MainTabView(container: DependencyContainer())
//}
