//
//  PreferencesView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 31/10/2026.
//

import SwiftUI

struct PreferencesView: View {
    @Environment(\.appTheme) private var theme
    @Environment(\.appColorTheme) private var colorTheme

    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Preferences")
                .font(.system(size: 20, weight: .semibold))
            
            VStack {
                //  Liquid Glass
                preferenceItem(
                    icon: "magnifyingglass",
                    title: "Liquid Glass",
                    subTitle: "Enable glass effects & blur",
                    imageColor: .mint,
                    backgroundColor: gradientColor([.mint.opacity(0.4), .mint.opacity(0.1)])
                )
                
                dividerHorizontal
                
                //  3D Tilt Frame
                preferenceItem(
                    icon: "rotate.3d",
                    title: "3D Tilt Cards",
                    subTitle: "Interactive 3D tilt effects",
                    imageColor: .orange,
                    backgroundColor: gradientColor([.orange.opacity(0.4), .orange.opacity(0.1)])
                )
                
                dividerHorizontal
                
                //  AI Features
                preferenceItem(
                    icon: "sparkles",
                    title: "AI Features",
                    subTitle: "Use AI-powered features",
                    imageColor: .purple,
                    backgroundColor: gradientColor([.purple.opacity(0.4), .purple.opacity(0.1)])
                )
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 15)
            .background {
                RoundedRectangle(cornerRadius: 25)
                    .fill(colorTheme.gradient.opacity(0.05))
            }
            .overlay {
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(colorTheme.gradient.opacity(0.5), lineWidth: 2)
            }
            .shadow(color: colorTheme.accent.opacity(0.55), radius: 12)
        }
    }
    
    // Preferences
    private func preferenceItem(
        icon: String,
        title: String, subTitle: String,
        imageColor: Color, backgroundColor: LinearGradient
    ) -> some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .font(.system(size: 21, weight: .medium))
                .padding(15)
                .foregroundStyle(imageColor)
                .background(RoundedRectangle(cornerRadius: 10).fill(backgroundColor))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(imageColor.opacity(0.4), lineWidth: 1.5))
                
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
//                    .foregroundStyle(theme.colorScheme == .light ? .black : .white)
                
                Text(subTitle)
                    .font(.system(size: 12, weight: .regular))
//                    .foregroundStyle(theme.colorScheme == .light ? .black.opacity(0.75) : .white.opacity(0.75))
            }
            
            Spacer()
            
            Toggle("", isOn: .constant(true))
                .tint(imageColor)
                .frame(width: 80)
        }
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .contentShape(Rectangle())
    }
    
    
    private var dividerHorizontal: some View {
        Rectangle()
//            .fill(theme.whiteBlackIconColor.opacity(0.15))
            .opacity(0.15)
            .frame(height: 1)
            .padding(.vertical, 10)
    }
}

#Preview {
    PreferencesView()
}
