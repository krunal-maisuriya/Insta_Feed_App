//
//  CreateFeedView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 29/10/2026.
//

import SwiftUI

struct CreateFeedView: View {
    @Environment(\.appColorTheme) private var colorTheme
    @Environment(\.dismiss) var dismiss

    @State private var description: String = ""
    @State private var descriptionError: String? = nil

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    // Left close button
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 50, height: 50)
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                        .buttonStyle(.plain)
                        .background(Circle().fill(Color.gray.opacity(0.3)))
                        .glassEffect(.regular.interactive(), in: Circle())
                        
                        Spacer()
                    }

                    VStack(alignment: .leading) {
                        CustomTextEditorView(
                            text: $description,
                            errorMessage: $descriptionError,
                            placeholder: "Enter description",
                        )
                        .frame(height: 250)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 15)
                        .scrollContentBackground(.hidden)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                            
                        Button(action: {
                            
                        }, label: {
                            HStack(alignment: .center) {
                                Image(systemName: "photo.badge.plus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                
                                Text("Add Photos")
                            }
                        })
                        .font(.system(size: 17, weight: .semibold))
                        .padding(.horizontal)
                        .padding(.vertical)
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(colorTheme.gradient.opacity(0.09))
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(colorTheme.gradient.opacity(0.6), lineWidth: 3)
                    }
                    .padding(.top, 30)
                                    
                    Button {
                        print("Button tapped")
                    } label: {
                        Text("Create Post")
                            .font(.system(size: 19, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                    }
                    .frame(height: 55)
                    .background(ColorLineView())
                    .overlay {
                        Capsule().stroke(.white.opacity(0.35), lineWidth: 1)
                    }
                    .buttonStyle(.plain)
                    .padding(.vertical, 20)
                }
                .padding(.horizontal)
                .padding(.vertical)
            }
        }
        .scrollDismissesKeyboard(.interactively)
    }
}

#Preview {
    CreateFeedView()
}


struct ColorLineView: View {
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
