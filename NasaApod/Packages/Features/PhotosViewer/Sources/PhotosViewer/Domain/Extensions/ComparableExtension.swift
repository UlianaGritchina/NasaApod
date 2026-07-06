//
//  ComparableExtension.swift
//  NasaApod
//
//  Created by Ульяна Гритчина on 06.07.2026.
//

import Foundation

extension Comparable {
    func clamped(to range: ClosedRange<Self>) -> Self {
        min(max(self, range.lowerBound), range.upperBound)
    }
}
