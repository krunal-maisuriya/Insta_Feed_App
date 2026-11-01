//
//  SunView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 31/10/2026.
//

import SwiftUI

struct SunView: View {
    var body: some View {
        ZStack {
            ForEach(0..<10) { i in
                Capsule()
                    .fill(Color.yellow.opacity(0.85))
                    .frame(width: 4, height: 16)
                    .offset(y: -33)
                    .rotationEffect(.degrees(Double(i) * 36))
            }
            Circle()
                .fill(Color(red: 0.98, green: 0.82, blue: 0.25))
                .frame(width: 38, height: 38)
                .shadow(color: .yellow.opacity(0.7), radius: 14)
        }
        .frame(width: 70, height: 70)
    }
}

#Preview {
    SunView()
}
