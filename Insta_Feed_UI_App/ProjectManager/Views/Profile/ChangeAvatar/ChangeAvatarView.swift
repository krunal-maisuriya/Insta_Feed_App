//
//  ChangeAvatarView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 30/10/2026.
//

import SwiftUI

struct ChangeAvatarView: View {
    
    @AppStorage("appColorTheme") private var avatarTheme = AppColorTheme.cyan.rawValue
    @AppStorage("avatarIcon") private var avatarIcon = "person.fill"

    @Environment(\.dismiss) private var dismiss

    @State private var selectedTheme: AppColorTheme = .cyan
    @State private var selectedIcon = "person.fill"

    private var currentColors: [Color] {
        selectedTheme.colors
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                gradientSelection
                    .padding(.top, 20)

                iconSelection
                    .padding(.top, 20)

                Spacer()
                applyButton
            }
            .onAppear {
                selectedTheme = AppColorTheme(rawValue: avatarTheme) ?? .cyan
                selectedIcon = avatarIcon
            }
        }
    }
    
    // MARK: - Gradient Selection
    private var gradientSelection: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionHeader(
                title: "Gradient Colors",
                subtitle: "Choose your favorite combination"
            )
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 4), spacing: 20) {
                ForEach(AppColorTheme.allCases, id: \.self) { theme in
                    Button {
                        withAnimation(.spring()) {
                            selectedTheme = theme
                        }
                    } label: {
                        VStack(spacing: 8) {
                            ZStack {
                                Circle()
                                    .fill(theme.gradient)
                                    .frame(width: 55, height: 55)
                                
                                if (selectedTheme == theme) {
                                    Image(systemName: "checkmark")
                                        .font(.headline.bold())
                                        .foregroundStyle(.white)
                                }
                            }
                            .overlay {
                                Circle()
                                    .strokeBorder(
                                        selectedTheme == theme
                                            ? Color.primary : Color.clear,
                                        lineWidth: 2
                                    )
                                    .padding(-4)
                            }
                            
                            Text(theme.name)
                                .font(.caption)
                                .foregroundStyle(.primary)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(18)
        .background(
            Color(uiColor: .secondarySystemGroupedBackground),
            in: RoundedRectangle(cornerRadius: 25)
        )
    }
    
    
    // MARK: - Icon Selection
    private var iconSelection: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionHeader(
                title: "Profile Icon",
                subtitle: "Select your profile symbol"
            )
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 4), spacing: 12) {
                ForEach(AppColorTheme.icons, id: \.self) { icon in
                    Button {
                        withAnimation(.spring()) { selectedIcon = icon }
                    } label: {
                        Image(systemName: icon)
                            .font(.system(size: 25))
                            .foregroundStyle(
                                selectedIcon == icon ? .white : currentColors.first!
                            )
                            .frame(maxWidth: .infinity)
                            .frame(height: 65)
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(selectedIcon == icon
                                          ? AnyShapeStyle(
                                            LinearGradient(
                                                colors: currentColors,
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        : AnyShapeStyle(
                                            Color(uiColor: .tertiarySystemGroupedBackground)
                                        )
                                    )
                            }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(18)
        .background(
            Color(uiColor: .secondarySystemGroupedBackground),
            in: RoundedRectangle(cornerRadius: 25)
        )
    }
    
    
    // MARK: - Apply Button
    private var applyButton: some View {
        Button {
            avatarTheme = selectedTheme.rawValue
            avatarIcon = selectedIcon

            dismiss()
        } label: {
            
            HStack {
                Image(systemName: "checkmark.circle.fill")
                Text("Apply Theme")
            }
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 17)
            .background(
                LinearGradient(colors: currentColors, startPoint: .leading, endPoint: .trailing), in: Capsule())
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Section Header
    private func sectionHeader(title: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.headline)

            Text(subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ChangeAvatarView()
}
