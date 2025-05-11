//
//  SimpleNeumorphicButtonStyle.swift
//  NeumorphicRadialMenu
//
//  Created by Mehran Khani on 11.05.2025.
//

import SwiftUI

struct SimpleNeumorphicButtonStyle: ButtonStyle {
    var isConcave: Bool = false

    func makeBody(configuration: Configuration) -> some View {
        let actualConcave = configuration.isPressed || isConcave

        let lightShadowColor = actualConcave ? NeumorphicColors.concaveLightShadow : NeumorphicColors.convexLightShadow
        let darkShadowColor = actualConcave ? NeumorphicColors.concaveDarkShadow : NeumorphicColors.convexDarkShadow

        let lightShadowX = actualConcave ? CGFloat(-5) : CGFloat(-8)
        let lightShadowY = actualConcave ? CGFloat(-5) : CGFloat(-8)
        let lightShadowBlur = actualConcave ? CGFloat(8) : CGFloat(10)

        let darkShadowX = actualConcave ? CGFloat(5) : CGFloat(8)
        let darkShadowY = actualConcave ? CGFloat(5) : CGFloat(8)
        let darkShadowBlur = actualConcave ? CGFloat(8) : CGFloat(10)

        let bgColor = NeumorphicColors.background

        configuration.label
            .padding(15)
            .background(bgColor)
            .clipShape(Circle())
            .shadow(color: lightShadowColor, radius: lightShadowBlur, x: lightShadowX, y: lightShadowY)
            .shadow(color: darkShadowColor, radius: darkShadowBlur, x: darkShadowX, y: darkShadowY)
            .scaleEffect(configuration.isPressed ? 0.96 : (isConcave ? 0.98 : 1.0))
            .animation(.spring(response: 0.2, dampingFraction: 0.7), value: configuration.isPressed)
            .animation(.spring(response: 0.2, dampingFraction: 0.7), value: isConcave)
    }
}
