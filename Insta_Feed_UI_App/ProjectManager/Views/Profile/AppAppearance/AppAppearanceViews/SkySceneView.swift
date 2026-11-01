//
//  SkySceneView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 31/10/2026.
//

import SwiftUI

struct SkySceneView: View {
    let isNight: Bool
    
    // x, y (fractions of size), diameter
    private let stars: [(CGFloat, CGFloat, CGFloat)] = [
        (0.08, 0.12, 3), (0.30, 0.20, 2), (0.45, 0.08, 2.5), (0.20, 0.45, 3),
        (0.58, 0.40, 2), (0.65, 0.28, 2.5), (0.92, 0.35, 3), (0.50, 0.55, 2),
        (0.38, 0.62, 2), (0.80, 0.60, 2)
    ]
    
    var body: some View {
        GeometryReader { proxy in
            let w = proxy.size.width
            let h = proxy.size.height
            
            ZStack {
                //  Sky
                LinearGradient(
                    colors: [Color(red: 0.43, green: 0.65, blue: 0.90),
                             Color(red: 0.76, green: 0.88, blue: 0.98)],
                    startPoint: .top, endPoint: .bottom
                )
                .opacity(isNight ? 0 : 1)
                
                LinearGradient(
                    colors: [Color(red: 0.05, green: 0.06, blue: 0.20),
                             Color(red: 0.18, green: 0.20, blue: 0.46)],
                    startPoint: .top, endPoint: .bottom
                )
                .opacity(isNight ? 1 : 0)
                
                //  Star
                ForEach(stars.indices, id: \.self) { i in
                    Circle()
                        .fill(.white.opacity(0.9))
                        .frame(width: stars[i].2, height: stars[i].2)
                        .position(x: w * stars[i].0, y: h * stars[i].1)
                        .opacity(isNight ? 1 : 0)
                        .animation(.easeInOut(duration: 0.6).delay(Double(i) * 0.04), value: isNight)
                }
                
                //  Cloud
                Group {
                    CloudView()
                        .frame(width: 100, height: 50).position(x: w * 0.17, y: h * 0.30)
                    CloudView()
                        .frame(width: 110, height: 55).position(x: w * 0.52, y: h * 0.45)
                }
                .opacity(isNight ? 0 : 1)
                
                // Sun
                SunView()
                    .position(x: w * 0.80, y: h * 0.27)
                    .offset(y: isNight ? 140 : 0)
                    .opacity(isNight ? 0 : 1)
                
                // Moon
                MoonView()
                    .position(x: w * 0.80, y: h * 0.27)
                    .offset(y: isNight ? 0 : -140)
                    .opacity(isNight ? 1 : 0)
                
                //  Hills
                ZStack(alignment: .bottom) {
                    Hill(phase: 0.0, amplitude: 0.10)
                        .fill(isNight ? Color(red: 0.24, green: 0.26, blue: 0.56) : Color(red: 0.74, green: 0.85, blue: 0.70))
                        .frame(height: h * 0.45)
                    
                    Hill(phase: 1.2, amplitude: 0.08)
                        .fill(isNight ? Color(red: 0.19, green: 0.21, blue: 0.47) : Color(red: 0.58, green: 0.76, blue: 0.57))
                        .frame(height: h * 0.33)
                    
                    Hill(phase: 2.4, amplitude: 0.06)
                        .fill(isNight ? Color(red: 0.14, green: 0.15, blue: 0.36) : Color(red: 0.40, green: 0.62, blue: 0.45))
                        .frame(height: h * 0.22)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                
                // House with a window that lights up at night
                ZStack {
                    Image(systemName: "house.fill")
                        .font(.system(size: 38))
                        .foregroundStyle(Color(white: isNight ? 0.12 : 0.3))
                    
                    Circle()
                        .fill(.yellow)
                        .frame(width: 7, height: 7)
                        .shadow(color: .yellow, radius: 5)
                        .offset(y: 4)
                        .opacity(isNight ? 1 : 0)
                }
                .position(x: w * 0.25, y: h * 0.68)
            }
            .animation(.easeInOut(duration: 0.7), value: isNight)
        }
    }
}

#Preview {
    SkySceneView(isNight: false)
}
