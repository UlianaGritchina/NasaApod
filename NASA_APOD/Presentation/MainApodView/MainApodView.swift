//
//  ApodView.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 24.06.2026.
//

import SwiftUI

struct MainApodView: View {
    private var viewModel: ViewModel
    
    init(_ viewModel: MainApodView.ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                switch viewModel.viewState {
                case .loading:
                    ProgressView()
                    
                case .loaded(let apod):
                    VStack {
                        Text(apod.title)
                        
                        AsyncImage(url: apod.url) { image in
                            image.resizable()
                        } placeholder: {
                            Rectangle()
                                .opacity(0)
                                .background(.ultraThinMaterial)
                                .cornerRadius(12)
                        }
                        .frame(height: 350)
                        .cornerRadius(12)
                        
                        Text(apod.explanation)
                    }
                    .padding(.horizontal)
                    
                case .error:
                    Text("try again later")
                }
            }
            .navigationTitle("APOD")
        }
    }
}

#Preview {
    MainApodView(MainApodView.ViewModel(repository: MockApodRepository()))
}

final class MockApodRepository: ApodRepository {
    func getApod(for date: Date) async throws -> Apod {
        try await Task.sleep(for: .seconds(1))
        return Apod(
            url: URL(string: "https://apod.nasa.gov/apod/image/2606/AR4478_vidal_960.jpg")!,
            title: "Moon",
            date: date,
            explanation: "Right now, one of the largest sunspot groups in recent history is crossing the Sun.  Active Region 4478 is not only big -- it's violent, showing tangled magnetic fields capable of throwing off huge clouds of particles into the Solar System.  Some of these CMEs might impact the Earth.  At the extreme, these solar storms could cause some Earth-orbiting satellites to malfunction, the Earth's atmosphere to slightly distort, and electrical power grids to surge.  When impacting Earth's upper atmosphere, these particles can produce beautiful auroras. Pictured here, AR 4478 and its dark sunspots were captured in visible light a few days ago from Barcelona, Spain.  Almost as large as AR 3664 was in 2024, the AR 4478 sunspot group is so big that it is visible just with glasses specially designed to view solar eclipses.  This week, skygazing enthusiasts all over the globe will not only be tracking AR 4478 during the day -- but keenly watching night skies for its corresponding bright auroras.   Sky Surprise: What picture did APOD feature on your birthday? (after 1995)",
            mediaType: .image,
            copyright: "UlianaGritchina",
            hdURL: nil
        )
    }
    
    func getTodayApod() async throws -> Apod {
        Apod(
            url: URL(string: "https://apod.nasa.gov/apod/image/2606/AR4478_vidal_960.jpg")!,
            title: "Moon",
            date: Date(),
            explanation: "Right now, one of the largest sunspot groups in recent history is crossing the Sun.  Active Region 4478 is not only big -- it's violent, showing tangled magnetic fields capable of throwing off huge clouds of particles into the Solar System.  Some of these CMEs might impact the Earth.  At the extreme, these solar storms could cause some Earth-orbiting satellites to malfunction, the Earth's atmosphere to slightly distort, and electrical power grids to surge.  When impacting Earth's upper atmosphere, these particles can produce beautiful auroras. Pictured here, AR 4478 and its dark sunspots were captured in visible light a few days ago from Barcelona, Spain.  Almost as large as AR 3664 was in 2024, the AR 4478 sunspot group is so big that it is visible just with glasses specially designed to view solar eclipses.  This week, skygazing enthusiasts all over the globe will not only be tracking AR 4478 during the day -- but keenly watching night skies for its corresponding bright auroras.   Sky Surprise: What picture did APOD feature on your birthday? (after 1995)",
            mediaType: .image,
            copyright: "UlianaGritchina",
            hdURL: nil
        )
    }
}
