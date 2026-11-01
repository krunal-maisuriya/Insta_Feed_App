//
//  GlassOrbView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 29/10/2026.
//

import SwiftUI

struct GlassOrbView: View {
    var body: some View {
        ZStack {
            Circle().fill(
                RadialGradient(colors: [
                    Color.cyan.opacity(0.95),
                    Color.blue.opacity(0.9),
                    Color.indigo.opacity(0.9),
                    Color.purple.opacity(0.75)
                ], center: .topLeading, startRadius: 5, endRadius: 210)
            )

            Circle().fill(
                RadialGradient(colors: [
                    .white.opacity(0.95),
                    .cyan.opacity(0.5),
                    .clear
                ], center: .topLeading, startRadius: 0, endRadius: 115))
            .padding(5)

            Circle().fill(
                LinearGradient(colors: [
                    .white.opacity(0.55),
                    .cyan.opacity(0.12),
                    .blue.opacity(0.25),
                    .purple.opacity(0.65)
                ], startPoint: .topLeading, endPoint: .bottomTrailing))
            .blendMode(.screen)
            .padding(4)

            Circle().stroke(
                LinearGradient(colors: [
                    .white.opacity(0.95),
                    .cyan.opacity(0.8),
                    .purple.opacity(0.85),
                    .blue.opacity(0.7)
                ], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
        }
        .clipShape(Circle())
        .overlay {
            Circle()
                .stroke(.white.opacity(0.25), lineWidth: 1)
                .blur(radius: 2)
        }
        .shadow(color: .blue.opacity(0.55), radius: 58)
        .shadow(color: .purple.opacity(0.3), radius: 30)
    }
}

#Preview {
    GlassOrbView()
}
