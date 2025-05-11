//
//  NeumorphicViewModifier.swift
//  NeumorphicRadialMenu
//
//  Created by Mehran Khani on 11.05.2025.
//

import SwiftUI

struct NeumorphicViewModifier<S: Shape>: ViewModifier {
    var shape: S

    let lightShadowX: CGFloat = -5
    let lightShadowY: CGFloat = -5
    let lightShadowBlur: CGFloat = 8

    let darkShadowX: CGFloat = 5
    let darkShadowY: CGFloat = 5
    let darkShadowBlur: CGFloat = 8

    init(shape: S) {
        self.shape = shape
    }

    func body(content: Content) -> some View {
        content
            .background(
                shape
                    .fill(NeumorphicColors.background)
                    .shadow(color: NeumorphicColors.convexLightShadow, radius: lightShadowBlur, x: lightShadowX, y: lightShadowY)
                    .shadow(color: NeumorphicColors.convexDarkShadow, radius: darkShadowBlur, x: darkShadowX, y: darkShadowY)
            )
    }
}

extension View {
    func neumorphic<S: Shape>(shape: S) -> some View {
        modifier(NeumorphicViewModifier(shape: shape))
    }

    func neumorphicCapsule() -> some View {
        modifier(NeumorphicViewModifier(shape: Capsule()))
    }

    func neumorphicRoundedRectangle(cornerRadius: CGFloat) -> some View {
        modifier(NeumorphicViewModifier(shape: RoundedRectangle(cornerRadius: cornerRadius)))
    }
}
