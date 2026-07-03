import Testing
import Foundation
@testable import APOD

@Suite()
struct MainApodViewModelTests {
    
    @MainActor
    @Test func fetchApodInfo() async throws {
        let mockApod = Apod.mock
        let mockImageData = Data([0, 0, 0])
        let repository = MockApodRepositoryTest(
            apod: mockApod,
            imageData: mockImageData
        )
        
        let viewModel = MainApodViewModel(repository: repository)
        
        await viewModel.fetchApodInfo()
        
        #expect(viewModel.viewState == .loaded(apod: mockApod))
        #expect(viewModel.apodImageData == mockImageData)
    }
}
