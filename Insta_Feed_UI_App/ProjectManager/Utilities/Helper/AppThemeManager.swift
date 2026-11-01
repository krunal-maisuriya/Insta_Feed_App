//
//  AppThemeManager.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 31/10/2026.
//

import SwiftUI

enum AppColorTheme: String, Identifiable, CaseIterable {
    case cyan, purple, pink, orange
    case green, blue, red, gold

    var id: String { rawValue }
    var name: String { rawValue.capitalized }

    
    // MARK: - Gradient Colors
    var colors: [Color] {
        switch self {
        case .cyan: [Color.cyan, Color.blue]
        case .purple: [Color.purple, Color.indigo]
        case .pink: [Color.pink, Color.purple]
        case .orange: [Color.orange, Color.red]
        case .green: [Color.mint, Color.green]
        case .blue: [Color.blue, Color.indigo]
        case .red: [Color.red, Color.pink]
        case .gold: [Color.yellow, Color.orange]
        }
    }
    
    // MARK: - Gradient
    var gradient: LinearGradient {
        LinearGradient(
            colors: colors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    // MARK: - Theme Colors
    var accent: Color { colors[0] }
    
    var border: Color { colors[0].opacity(0.65) }
    
    // MARK: - Profile Icons
    static var icons: [String] {
        [
            "person.fill",
            "paintbrush.pointed.fill",
            "face.smiling.fill",
            "crown.fill",
            "paperplane.fill",
            "briefcase.fill",
            "curlybraces",
            "star.fill",
        ]
    }
}
