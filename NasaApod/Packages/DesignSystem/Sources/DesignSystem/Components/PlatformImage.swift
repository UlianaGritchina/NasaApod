//
//  PlatformImage.swift
//  Platform
//
//  Created by Ульяна Гритчина on 05.07.2026.
//

#if os(iOS)
import UIKit

public typealias PlatformImage = UIImage

#elseif os(macOS)
import AppKit

public typealias PlatformImage = NSImage

#endif

import SwiftUI

public extension Image {
    init(platformImage: PlatformImage) {
        #if os(iOS)
        self.init(uiImage: platformImage)
        #elseif os(macOS)
        self.init(nsImage: platformImage)
        #endif
    }
}
