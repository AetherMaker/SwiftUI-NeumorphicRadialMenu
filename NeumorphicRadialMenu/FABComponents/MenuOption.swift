//
//  MenuOption.swift
//  NeumorphicRadialMenu
//
//  Created by Mehran Khani on 11.05.2025.
//

import SwiftUI

struct MenuOption: Identifiable {
    let id = UUID()
    let iconName: String
    var iconColor: Color = NeumorphicColors.textColor
    let action: () -> Void
}
