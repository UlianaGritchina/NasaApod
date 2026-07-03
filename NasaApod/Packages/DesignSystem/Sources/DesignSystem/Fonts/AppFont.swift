//
//  AppFont.swift
//  NASA_APOD
//
//  Created by Ульяна Гритчина on 30.06.2026.
//

import SwiftUI

public extension Font {
    static let appTitle = Font.system(size: 28, weight: .bold)
    static let appSubTitle = Font.system(size: 19, weight: .semibold)
    static let appBody = Font.system(size: 16)
    static let appCaption = Font.system(size: 14)
    static let appDate = Font.system(size: 14, design: .monospaced)
}
