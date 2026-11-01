//
//  AppAppearanceView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 30/10/2026.
//

import SwiftUI

struct AppAppearanceView: View {
    @AppStorage("appearance") private var appearance: AppAppearanceModel = .system
    @Environment(\.appTheme) private var scheme
    @Namespace private var pill
    
    private var isNight: Bool {
        switch appearance {
        case .dark:
            return true
        case .light:
            return false
        case .system:
            return scheme.colorScheme == .dark
        }
    }
    
    
    var body: some View {
        VStack(spacing: 18) {
            SkySceneView(isNight: isNight)
                .frame(height: 230)
                .clipShape(RoundedRectangle(cornerRadius: 26, style: .continuous))
            
            HStack(spacing: 0) {
                ForEach(AppAppearanceModel.allCases) { option in
                    optionButton(option)
                }
            }
            .padding(4)
            .background(Color.primary.opacity(0.07), in: Capsule())
            
            Text(appearance.caption)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .contentTransition(.opacity)
        }
        .padding(16)
    }
    
    @ViewBuilder
    private func optionButton(_ option: AppAppearanceModel) -> some View {
        let selected = appearance == option
        let accent: Color = isNight ? .indigo : .yellow
        
        Button {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                appearance = option
            }
        } label: {
            Label(option.title, systemImage: option.icon)
                .font(.headline)
                .foregroundStyle(.primary)
                .symbolRenderingMode(.palette)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background {
                    if selected {
                        Capsule()
                            .fill(Color(.systemBackground))
                            .overlay(Capsule().strokeBorder(accent.opacity(0.8), lineWidth: 2))
                            .shadow(color: accent.opacity(0.35), radius: 6)
                            .matchedGeometryEffect(id: "pill", in: pill)
                    }
                }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AppAppearanceView()
}

