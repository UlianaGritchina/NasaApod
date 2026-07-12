//
//  DSColor.swift
//  DesignSystem
//
//  Created by Ульяна Гритчина on 07.07.2026.
//

import SwiftUI

public enum DSColor {
    public static let background = Color(
        ColorName.appBackground.rawValue,
        bundle: .module
    )
    public static let cardBackground = Color(
        ColorName.cardBackground.rawValue,
        bundle: .module
    )
    public static let text = Color(
        ColorName.text.rawValue,
        bundle: .module
    )
    public static let secondaryGray = Color(
        ColorName.secondaryGray.rawValue,
        bundle: .module
    )
}
