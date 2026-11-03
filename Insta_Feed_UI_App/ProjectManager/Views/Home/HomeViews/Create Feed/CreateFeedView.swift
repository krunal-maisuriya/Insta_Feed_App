//
//  CreateFeedView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 29/10/2026.
//

import SwiftUI

struct CreateFeedView: View {
    @Bindable var feedViewModel: FeedViewModel
    
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
                                
                                Text("Add a photo")
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
                        Task {                            
                            await feedViewModel.createPost(
                                description: description,
                                userName: "Krunal Maisuriya",
                                imageURL: "https://example.com/image.jpg"
                            )
                            
                            if feedViewModel.errorMessage == nil {
                                dismiss()
                            }
                        }
                    } label: {
                        HStack {
                            Spacer()
                            
                            if feedViewModel.isLoading {
                                ProgressView()
                            } else {
                                Text("Create Post")
                                    .font(.system(size: 19, weight: .bold))
                                    .frame(maxWidth: .infinity)
                                    .foregroundStyle(.white)
                            }
                            Spacer()
                        }
                    }
                    .frame(height: 55)
                    .background(CustomLineColorView())
                    .overlay {
                        Capsule().stroke(.white.opacity(0.35), lineWidth: 1)
                    }
                    .buttonStyle(.plain)
                    .padding(.vertical, 20)
                    .disabled(description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || feedViewModel.isLoading)
                }
                .padding(.horizontal)
                .padding(.vertical)
            }
        }
        .scrollDismissesKeyboard(.interactively)
    }
}

#Preview {
    CreateFeedView(feedViewModel: FeedViewModel())
}
