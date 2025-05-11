//
//  ContentView.swift
//  NeumorphicRadialMenu
//
//  Created by Mehran Khani on 11.05.2025.
//

import SwiftUI

struct ContentView: View {
    let menuOptions: [MenuOption] = [
        MenuOption(iconName: "pencil", iconColor: .blue, action: { print("Edit Tapped") }),
        MenuOption(iconName: "square.and.arrow.up", iconColor: .green, action: { print("Share Tapped") }),
        MenuOption(iconName: "trash", iconColor: .red, action: { print("Delete Tapped") }),
//        MenuOption(iconName: "gearshape", iconColor: .purple, action: { print("Settings Tapped") })
    ]

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NeumorphicColors.background.ignoresSafeArea()

            VStack {
                Spacer()

                Text("Neumorphic Radial Menu")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(NeumorphicColors.textColor)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
//                    .neumorphicCapsule()
                    .neumorphicRoundedRectangle(cornerRadius: 12)

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            NeumorphicRadialFAB(options: menuOptions)
                .padding(30)
        }
    }
}

#Preview {
    ContentView()
}
