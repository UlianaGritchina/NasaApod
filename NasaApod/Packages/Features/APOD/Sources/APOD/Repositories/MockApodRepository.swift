//
//  MockApodRepository.swift
//  APOD
//
//  Created by Ульяна Гритчина on 29.06.2026.
//

#if os(iOS)
import SwiftUI
#elseif os(macOS)
import AppKit
#endif
import Foundation
import NasaModels

public final class MockApodRepository: ApodRepository {
    
    public init() { }
    
#if os(iOS)
    public func getApodImageData(for url: URL, date: Date) async throws -> Data  {
        guard let image = UIImage(named: "sombrero") else {
            return Data()
        }
        return image.jpegData(compressionQuality: 1.0) ?? Data()
    }
    
#elseif os(macOS)
    public func getApodImageData(for url: URL, date: Date) async throws -> Data {
        guard let image = NSImage(named: "sombrero") else {
            return Data()
        }
        guard let tiffData = image.tiffRepresentation,
              let bitmap = NSBitmapImageRep(data: tiffData),
              let data = bitmap.representation(using: .jpeg, properties: [:]) else {
            return Data()
        }
        return data
    }
#endif
    
    public func getApod(for date: Date) async throws -> Apod {
        try await Task.sleep(for: .seconds(1))
        return Apod(
            url: URL(string: "https://apod.nasa.gov/apod/image/2606/AR4478_vidal_960.jpg")!,
            title: "The Sombrero Galaxy",
            date: date,
            explanation: "In the constellation Virgo, some 31 million light-years from Earth, lies one of the most visually striking galaxies in the nearby Universe — Sombrero Galaxy. At first glance, it resembles a cosmic hat suspended in the darkness: a bright, bulging central core wrapped in a razor-thin disk of dust. This dark lane is not empty space, but a dense ring of cold interstellar material, concealing regions where new stars are slowly taking shape. At its heart resides a supermassive black hole, containing billions of times the mass of our Sun. Though invisible, its influence is written into the motion of the galaxy’s inner regions, where stars orbit at tremendous speeds under its gravitational grip. Viewed almost edge-on from our perspective, the Sombrero reveals a striking contrast between structure and emptiness. A smooth halo of ancient stars extends far beyond the disk, a faint glow that speaks of a long and quiet evolutionary The light we observe today began its journey when early humans had not yet appeared on Earth. It has traveled across intergalactic space for tens of millions of years, arriving now as a delicate message from a distant epoch. In this single frame of light and shadow, the Sombrero Galaxy becomes more than an object—it is a cosmic archive, preserving the memory of star formation, gravity, and time itself.",
            mediaType: .image,
            copyright: "Hubble Space Telescope",
            hdURL: nil
        )
    }
}

