//
//  Insta_Feed_UI_AppApp.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 24/10/2026.
//

import SwiftUI

@main
struct Insta_Feed_UI_AppApp: App {
    
    @AppStorage("appColorTheme")
    private var appColorTheme = AppColorTheme.cyan.rawValue

    @AppStorage("appearance")
    private var appearance: AppAppearanceModel = .system

    @Environment(\.colorScheme) private var systemColorScheme

    private var currentColorScheme: ColorScheme {
        appearance.colorScheme ?? systemColorScheme
    }
    
    private var selectedTheme: AppColorTheme {
        AppColorTheme(rawValue: appColorTheme) ?? .cyan
    }
    
    @State private var feedViewModel = FeedViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(selectedTheme.accent)
                .environment(\.appTheme, AppTheme(colorScheme: currentColorScheme))
                .environment(\.appColorTheme, AppThemeStyle(selected: selectedTheme))
                .environment(feedViewModel)
                .preferredColorScheme(appearance.colorScheme)
        }
    }
}
