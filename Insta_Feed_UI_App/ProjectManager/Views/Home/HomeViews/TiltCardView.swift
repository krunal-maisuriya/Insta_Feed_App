//
//  TiltCardView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 24/10/2026.
//

import SwiftUI


struct TiltCardView: View {
    @Environment(\.appColorTheme) private var colorTheme
    
    @State private var dragX: CGFloat = 0.0
    @State private var dragY: CGFloat = 0.0

    
    var body: some View {
        ZStack {
            // Only the border rotates
            RoundedRectangle(cornerRadius: 24)
                .fill(colorTheme.gradient.opacity(0.05))
                .overlay {
                    RoundedRectangle(cornerRadius: 24)
                        .strokeBorder(colorTheme.gradient.opacity(0.5), lineWidth: 3)
                }
                .rotation3DEffect(
                    .degrees(Double(dragX) * 0.12),
                    axis: (x: 0, y: 1, z: 0), perspective: 0.5)
                .rotation3DEffect(
                    .degrees(Double(dragY) * -0.12),
                    axis: (x: 1, y: 0, z: 0), perspective: 0.5)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ value in
                            dragX = value.translation.width
                            dragY = value.translation.height
                        })
                        .onEnded({ _ in
                            withAnimation(.spring()) {
                                dragX = 0
                                dragY = 0
                            }
                        })
                )
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Circle()
                        .fill(colorTheme.gradient.opacity(0.5))
                        .frame(width: 55, height: 55)
                        .overlay {
                            Image(systemName: "cube.transparent")
                                .font(.system(size: 30))
                        }
                    
                    VStack(alignment: .leading) {
                        Text("Your Name")
                            .font(.system(size: 17, weight: .bold))
                        HStack {
                            Text("@yourusername")
                                .font(.system(size: 13, weight: .medium))
                            
                            Text("· Just now")
                                .font(.system(size: 13, weight: .medium))
                        }
                        .opacity(0.7)
                    }
                    
                    Spacer()
                    
                    Capsule()
                        .fill(Color.blue.opacity(0.7).gradient)
                        .frame(width: 80, height: 35)
                        .overlay {
                            Text("Follow")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                }
                                
                Text("Hello, some description ")
                    .font(.system(size: 15, weight: .regular))
                    .padding(.vertical, 5)

                RoundedRectangle(cornerRadius: 25)
                    .fill(colorTheme.gradient.opacity(0.2))
                    .frame(height: 180)
                    .overlay {
                        Image("image1")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 180)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                
                HStack(spacing: 25) {
                    HStack(spacing: 5) {
                        Image(systemName: "heart")
                            .onTapGesture {
                                
                            }
                        
                        Text("0")
                            .padding(.vertical, 10)
                            .font(.system(size: 14, weight: .bold))
                    }
                    
                    HStack(spacing: 5) {
                        Image(systemName: "bubble")
                            .onTapGesture {
                                
                            }
                        
                        Text("1")
                            .padding(.vertical, 10)
                            .font(.system(size: 14, weight: .bold))
                    }
                    
                    Image(systemName: "paperplane")
                        .onTapGesture {
                            
                        }
                    
                    Spacer()
                    
                    Image(systemName: "bookmark")
                        .onTapGesture {
                            
                        }
                }
            }
            .padding(15)
            .frame(maxWidth: .infinity)
        }.frame(maxWidth: .infinity)
    }
}


#Preview {
    TiltCardView()
}


func gradientColor(_ colors: [Color]) -> LinearGradient {
    return LinearGradient(
        colors: colors,
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
