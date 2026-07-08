//
//  GlassModifier.swift.swift
//  DesignSystem
//
//  Created by Ульяна Гритчина on 05.07.2026.
//

import SwiftUI

public struct GlassModifier: ViewModifier {
    
    public func body(content: Content) -> some View {
        if #available(iOS 26, *) {
            content
                .glassEffect()
        } else {
            content
                .background(.background)
        }
    }
}

extension View {
    public func glassModifier() -> some View {
        modifier(GlassModifier())
    }
}
