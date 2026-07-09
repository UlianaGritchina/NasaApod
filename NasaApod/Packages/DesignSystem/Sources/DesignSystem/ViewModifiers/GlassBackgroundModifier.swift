//
//  GlassModifier.swift.swift
//  DesignSystem
//
//  Created by Ульяна Гритчина on 05.07.2026.
//

import SwiftUI

public struct GlassBackgroundModifier<S: Shape>: ViewModifier {
    private let shape: S

    public init(shape: S) {
        self.shape = shape
    }

    public func body(content: Content) -> some View {
        if #available(iOS 26, *) {
            content
                .glassEffect(in: shape)
        } else {
            content
                .background(.background, in: shape)
        }
    }
}

extension View {
    public func glassBackground<S: Shape>(shape: S) -> some View {
        modifier(GlassBackgroundModifier(shape: shape))
    }
    
    public func glassBackground() -> some View {
        modifier(GlassBackgroundModifier(shape: Rectangle()))
    }
}
