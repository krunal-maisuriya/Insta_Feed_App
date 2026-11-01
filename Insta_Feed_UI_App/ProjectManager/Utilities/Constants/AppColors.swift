//
//  AppColors.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 31/10/2026.
//

import SwiftUI

struct AppTheme {
    let colorScheme: ColorScheme
    
    var isDark: Bool {
        colorScheme == .dark
    }
    
    var viewBackgroundColor: Color {
        isDark ? .black : Color.gray.opacity(0.07)
    }
    
    var whiteBlackIconColor: Color {
        isDark ? .white : Color.black
    }
}


private struct AppThemeKey: EnvironmentKey {
    static let defaultValue = AppTheme(colorScheme: .light)
}

extension EnvironmentValues {
    var appTheme: AppTheme {
        get { self[AppThemeKey.self] }
        set { self[AppThemeKey.self] = newValue }
    }
}
