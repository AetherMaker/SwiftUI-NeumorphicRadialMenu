//
//  NeumorphicButtonStyle.swift
//  NeumorphicRadialMenu
//
//  Created by Mehran Khani on 11.05.2025.
//

import SwiftUI

struct NeumorphicButtonStyle: ButtonStyle {
    var isConcave: Bool = false

    let outerLightShadowOpacity: Double = 0.8
    let outerDarkShadowOpacity: Double = 0.25
    let outerShadowRadius: CGFloat = 8
    let outerShadowOffsetX: CGFloat = 6

    // For inner bevel / pressed look
    let innerBevelBlur: CGFloat = 3
    let innerBevelOffset: CGFloat = 2
    let innerBevelStrokeWidth: CGFloat = 3

    // For "pressed" overlay strokes
    let pressedStrokeBlur: CGFloat = 2
    let pressedStrokeOffset: CGFloat = 1
    let pressedStrokeWidth: CGFloat = 1.5

    // Scale effect
    let scalePressed: CGFloat = 0.96
    let scaleDefault: CGFloat = 1.0

    func makeBody(configuration: Configuration) -> some View {
        let showPressedEffect = configuration.isPressed || isConcave

        configuration.label
            .padding(20)
            .background(
                ZStack {
                    Circle()
                        .fill(NeumorphicColors.background)

                    Circle()
                        .stroke(NeumorphicColors.background, lineWidth: innerBevelStrokeWidth)
                        .blur(radius: innerBevelBlur)
                        .offset(x: -innerBevelOffset, y: -innerBevelOffset)
                        .mask(
                            Circle().fill(LinearGradient(
                                colors: [NeumorphicColors.convexLightShadow.opacity(0.5), NeumorphicColors.background.opacity(0.001)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                        )

                    Circle()
                        .stroke(NeumorphicColors.background, lineWidth: innerBevelStrokeWidth)
                        .blur(radius: innerBevelBlur)
                        .offset(x: innerBevelOffset, y: innerBevelOffset)
                        .mask(
                            Circle().fill(LinearGradient(
                                colors: [NeumorphicColors.convexDarkShadow.opacity(0.7), NeumorphicColors.background.opacity(0.001)],
                                startPoint: .bottomTrailing,
                                endPoint: .topLeading
                            ))
                        )
                }
            )
            .clipShape(Circle())
            .shadow(color: NeumorphicColors.convexLightShadow.opacity(showPressedEffect ? 0 : outerLightShadowOpacity),
                    radius: showPressedEffect ? innerBevelBlur : outerShadowRadius,
                    x: showPressedEffect ? innerBevelOffset : -outerShadowOffsetX,
                    y: showPressedEffect ? innerBevelOffset : -outerShadowOffsetX)
            .shadow(color: NeumorphicColors.convexDarkShadow.opacity(showPressedEffect ? 0 : outerDarkShadowOpacity),
                    radius: showPressedEffect ? innerBevelBlur : outerShadowRadius,
                    x: showPressedEffect ? -innerBevelOffset : outerShadowOffsetX,
                    y: showPressedEffect ? -innerBevelOffset : outerShadowOffsetX)
            .overlay {
                if showPressedEffect {
                    Circle()
                        .stroke(NeumorphicColors.concaveDarkShadow, lineWidth: pressedStrokeWidth)
                        .blur(radius: pressedStrokeBlur)
                        .offset(x: pressedStrokeOffset, y: pressedStrokeOffset)
                        .clipShape(Circle())

                    Circle()
                        .stroke(NeumorphicColors.concaveLightShadow, lineWidth: pressedStrokeWidth)
                        .blur(radius: pressedStrokeBlur)
                        .offset(x: -pressedStrokeOffset, y: -pressedStrokeOffset)
                        .clipShape(Circle())
                }
            }
            .scaleEffect(showPressedEffect ? scalePressed : scaleDefault)
            .animation(.spring(response: 0.2, dampingFraction: 0.7), value: showPressedEffect)
    }
}
