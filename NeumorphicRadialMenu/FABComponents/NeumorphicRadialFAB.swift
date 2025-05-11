//
//  NeumorphicRadialFAB.swift
//  NeumorphicRadialMenu
//
//  Created by Mehran Khani on 11.05.2025.
//

import SwiftUI

struct NeumorphicRadialFAB: View {
    @State private var isExpanded = false

    let mainIcon: String = "plus"
    let expandedIcon: String = "xmark"
    let options: [MenuOption]

    let expansionRadius: CGFloat = 100
    let optionButtonSize: CGFloat = 50
    let mainButtonSize: CGFloat = 60

    var body: some View {
        ZStack {
            ForEach(options.indices, id: \.self) { index in
                let option = options[index]
                Button(action: {
                    option.action()
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                        isExpanded = false
                    }
                }) {
                    Image(systemName: option.iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: optionButtonSize * 0.4, height: optionButtonSize * 0.4)
                        .foregroundColor(option.iconColor)
                }
                .buttonStyle(SimpleNeumorphicButtonStyle())
                .frame(width: optionButtonSize, height: optionButtonSize)
                .offset(offsetForOption(at: index))
                .opacity(isExpanded ? 1 : 0)
                .scaleEffect(isExpanded ? 1 : 0.5)
                .animation(
                    .spring(response: 0.4, dampingFraction: 0.6)
                        .delay(isExpanded ? Double(index) * 0.05 : 0),
                    value: isExpanded
                )
            }

            Button(action: {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                    isExpanded.toggle()
                }
            }) {
                ZStack {
                    Image(systemName: mainIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.green)
                        .opacity(isExpanded ? 0 : 1)
                        .rotationEffect(.degrees(isExpanded ? -45 : 0))

                    Image(systemName: expandedIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.red)
                        .opacity(isExpanded ? 1 : 0)
                        .rotationEffect(.degrees(isExpanded ? 0 : 45))
                }
                .frame(width: mainButtonSize * 0.4, height: mainButtonSize * 0.4)
                .animation(.easeInOut(duration: 0.3), value: isExpanded)
            }
            .buttonStyle(SimpleNeumorphicButtonStyle(isConcave: isExpanded))
            .frame(width: mainButtonSize, height: mainButtonSize)
            .zIndex(1)
        }
    }

    private func offsetForOption(at index: Int) -> CGSize {
        guard isExpanded else { return .zero }

        let totalAngleSpread: CGFloat = .pi / 2
        let startAngle: CGFloat = -(CGFloat.pi / 2)

        let angleStep: CGFloat
        if options.count <= 1 {
            angleStep = 0
        } else {
            angleStep = totalAngleSpread / CGFloat(options.count - 1)
        }

        let angle = startAngle - (CGFloat(index) * angleStep)

        let xOffset = expansionRadius * cos(angle)
        let yOffset = expansionRadius * sin(angle)

        return CGSize(width: xOffset, height: yOffset)
    }
}
