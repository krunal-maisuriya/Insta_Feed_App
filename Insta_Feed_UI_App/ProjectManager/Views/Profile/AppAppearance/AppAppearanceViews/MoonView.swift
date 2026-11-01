//
//  MoonView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 31/10/2026.
//

import SwiftUI

struct MoonView: View {
    var body: some View {
        // Crescent = full circle minus an offset circle
        Circle()
            .fill(Color(red: 1.0, green: 0.98, blue: 0.9))
            .frame(width: 60, height: 60)
            .mask {
                Circle()
                    .frame(width: 60, height: 60)
                    .overlay {
                        Circle()
                            .frame(width: 54, height: 54)
                            .offset(x: 16, y: -10)
                            .blendMode(.destinationOut)
                    }
                    .compositingGroup()
            }
            .shadow(color: .white.opacity(0.6), radius: 14)
    }
}

#Preview {
    MoonView()
}
