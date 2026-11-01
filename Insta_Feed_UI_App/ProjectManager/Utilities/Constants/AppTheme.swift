//
//  AppTheme.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 31/10/2026.
//

import SwiftUI

struct AppThemeStyle {
    let selected: AppColorTheme
    
    var accent: Color {
        selected.accent
    }
    
    var gradient: LinearGradient {
        selected.gradient
    }
    
    var border: Color {
        selected.border
    }
    
    var cardBorder: Color {
        selected.accent.opacity(0.35)
    }
}

private struct AppThemeStyleKey: EnvironmentKey {
    static let defaultValue = AppThemeStyle(selected: .cyan)
}

extension EnvironmentValues {
    var appColorTheme: AppThemeStyle {
        get { self[AppThemeStyleKey.self] }
        set { self[AppThemeStyleKey.self] = newValue }
    }
}
