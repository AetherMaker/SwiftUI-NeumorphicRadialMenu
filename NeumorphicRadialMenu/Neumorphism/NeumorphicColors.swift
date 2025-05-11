//
//  NeumorphicColors.swift
//  NeumorphicRadialMenu
//
//  Created by Mehran Khani on 11.05.2025.
//

import SwiftUI

enum NeumorphicColors {
    static let background = Color(hex: "E5E5E5")
    static let textColor = Color(hex: "0D2750").opacity(0.75)

    // --- For Convex (Drop Shadow) ---
    static let convexLightShadow = Color(hex: "FFFFFF").opacity(1.0)
    static let convexDarkShadow = Color(hex: "0D2750").opacity(0.25)

    // --- For Concave (Simulating Inner Shadow) ---
    static let concaveLightShadow = Color(hex: "FFFFFF").opacity(0.64)
    static let concaveDarkShadow = Color(hex: "0D2750").opacity(0.20)
}
