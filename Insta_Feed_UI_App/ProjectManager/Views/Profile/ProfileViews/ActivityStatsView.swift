//
//  ActivityStatsView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 31/10/2026.
//

import SwiftUI

struct ActivityStatsView: View {
    @Environment(\.appTheme) private var theme
    @Environment(\.appColorTheme) private var colorTheme

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Activity Stats")
                .font(.system(size: 20, weight: .semibold))
//                .foregroundStyle(theme.colorScheme == .light ? .black : .white)
            
            VStack {
                HStack(alignment: .center) {
                    //  Posts
                    activityItem(icon: "long.text.page.and.pencil", count: "0", title: "Posts", color: .green)
                    
                    dividerVertical
                    
                    //  Likes
                    activityItem(icon: "heart", count: "0", title: "Likes", color: .pink)
                    
                    dividerVertical
                    
                    //  Saved
                    activityItem(icon: "bookmark", count: "0", title: "Saved", color: .purple)
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 15)
            }
            .frame(height: 145)
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
    
    // Activity Item
    private func activityItem(icon: String, count: String, title: String, color: Color) -> some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .font(.system(size: 21, weight: .medium))
                .foregroundStyle(color)
                .shadow(color: color.opacity(0.7), radius: 7)
                
            Text(count)
                .font(.system(size: 25, weight: .bold))
//                .foregroundStyle(theme.colorScheme == .dark ? .white : .black)
            
            Text(title)
                .font(.system(size: 17, weight: .regular))
//                .foregroundStyle(theme.colorScheme == .dark ? .white.opacity(0.65) : .black.opacity(0.65))
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .contentShape(Rectangle())
    }
    
    private var dividerVertical: some View {
        Rectangle()
            .opacity(0.15)
//            .fill(theme.whiteBlackIconColor.opacity(0.15))
            .frame(width: 1)
            .padding(.vertical, 10)
    }
}

#Preview {
    ActivityStatsView()
}
