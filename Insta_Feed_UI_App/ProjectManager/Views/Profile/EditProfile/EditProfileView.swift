//
//  EditProfileView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 30/10/2026.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.appTheme) private var theme
    @Environment(\.appColorTheme) private var colorTheme
    
    @State private var txtYourName: String = ""
    @State private var txtuserName: String = ""
    @State private var txtDescription: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            theme.viewBackgroundColor
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ZStack(alignment: .center) {
                        // Left close button
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Text("Cancel")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundStyle(theme.colorScheme == .light ? .black : .white)
                                    .padding(.vertical)
                                    .padding(.horizontal, 20)
                            }
                            .buttonStyle(.plain)
                            .background(Capsule().fill(Color.gray.opacity(0.3)))
                            .glassEffect(.regular, in: Capsule())
                            
                            Spacer()
                        }
                        
                        Text("Edit Profile")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(theme.colorScheme == .light ? .black : .white)
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading) {
                            Text("Full Name")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(theme.colorScheme == .light ? .black : .white)
                            
                            TextField("Enter Your Name", text: $txtYourName)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.8), lineWidth: 1)
                                }
                        }

                        VStack(alignment: .leading) {
                            Text("Username")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(theme.colorScheme == .light ? .black : .white)

                            TextField("Enter UserName", text: $txtuserName)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.8), lineWidth: 1)
                                }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Description")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(theme.colorScheme == .light ? .black : .white)
                            
                            CustomTextEditorView(text: $txtDescription, errorMessage: .constant(""), placeholder: "Enter Description")
                                .frame(height: 160)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 10)
                                .scrollContentBackground(.hidden)
                                .background(Color.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.8), lineWidth: 1)
                                }
                        }
                    }
                    .padding(.vertical, 25)
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 25).fill(colorTheme.gradient.opacity(0.05))
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 25).stroke(colorTheme.gradient.opacity(0.6), lineWidth: 3)
                    }
                    .padding(.vertical, 30)
                    
                    Button {
                        print("Button tapped")
                    } label: {
                        Text("Edit Profile")
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
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .scrollDismissesKeyboard(.interactively)
    }
}

#Preview {
    EditProfileView()
}
