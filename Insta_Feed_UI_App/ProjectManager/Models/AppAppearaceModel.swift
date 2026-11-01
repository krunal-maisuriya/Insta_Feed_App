//
//  AppAppearaceModel.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 30/10/2026.
//

import Foundation
import SwiftUI

enum AppAppearanceModel: String, CaseIterable, Identifiable {
    case light, dark, system
    
    var id: String { rawValue }
    var title: String { rawValue.capitalized }
    
    var icon: String {
        switch self {
        case .light:  "sun.max.fill"
        case .dark:   "moon.fill"
        case .system: "circle.lefthalf.filled"
        }
    }
    
    var colorScheme: ColorScheme? {
        switch self {
        case .light: .light
        case .dark: .dark
        case .system: nil
        }
    }
    
    var caption: String {
        switch self {
        case .light:  "Light appearance stays on, day and night."
        case .dark:   "Dark appearance stays on, day and night."
        case .system: "Matches your device settings automatically."
        }
    }
}
