//
//  File.swift
//  APOD
//
//  Created by Ульяна Гритчина on 01.07.2026.
//

import ApodDomain
import Foundation
@testable import APOD

final class MockApodRepositoryTest: ApodRepository {
    
    let apodResult: Apod
    let imageDataResult: Data
    
    init(apod: Apod, imageData: Data) {
        self.apodResult = apod
        self.imageDataResult = imageData
    }
    
    func getApod(for date: Date) async throws -> Apod {
        apodResult
    }
    
    func getApodImageData(for url: URL, date: Date) async throws -> Data {
        imageDataResult
    }
}
