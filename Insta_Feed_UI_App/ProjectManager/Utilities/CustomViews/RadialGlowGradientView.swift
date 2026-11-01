//
//  RadialGlowGradientView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 29/10/2026.
//

import SwiftUI

struct RadialGlowGradientView: View {
    
    var colors: [Color]
    var startRadius: CGFloat
    var endRadius: CGFloat
    
    var size: CGSize
    var xPosition: CGFloat
    var yPosition: CGFloat
    
    var body: some View {
        GeometryReader { proxy in
            RadialGradient(
                colors: colors,
                center: .center,
                startRadius: startRadius,
                endRadius: endRadius,
            )
            .frame(width: size.width, height: size.height)
            .position(
                x: proxy.size.width * xPosition,
                y: proxy.size.height * yPosition
            )
        }
    }
}
