//
//  CustomLineColorView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 03/11/2026.
//

import SwiftUI

struct CustomLineColorView: View {
    @Environment(\.appColorTheme) private var colorTheme
    
    private let colors: [Color] = [
        .pink.opacity(0.1), .purple.opacity(0.1), .blue.opacity(0.1), .cyan.opacity(0.1),
        .orange.opacity(0.1), .green.opacity(0.1), .yellow.opacity(0.1), .red.opacity(0.1)
    ]

    var body: some View {
        ZStack {
            Capsule()
                .fill(Color.black.opacity(0.9))

            Canvas { context, size in
                let spacing: CGFloat = 7
                let lineLength = size.height

                for x in stride(
                    from: -lineLength,
                    through: size.width,
                    by: spacing
                ) {
                    var path = Path()
                    path.move(to: CGPoint(x: x, y: 0))
                    path.addLine(
                        to: CGPoint(
                            x: x + lineLength,
                            y: size.height
                        )
                    )

                    let color = colors.randomElement() ?? .blue

                    context.stroke(
                        path,
                        with: .color(color.opacity(0.8)),
                        lineWidth: 1.5
                    )
                }
            }
            .background(Capsule().fill(colorTheme.gradient))
            .clipShape(Capsule())
        }
    }
}

#Preview {
    CustomLineColorView()
}
