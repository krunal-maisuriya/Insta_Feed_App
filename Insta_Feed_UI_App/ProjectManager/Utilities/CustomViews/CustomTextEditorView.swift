//
//  CustomTextEditorView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 30/10/2026.
//

import SwiftUI

struct CustomTextEditorView: View {
    
    @Binding var text: String
    @Binding var errorMessage: String?
    var placeholder: String        

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundStyle(.gray)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 8)
                }
                
                TextEditor(text: $text)
                    .foregroundStyle(.white)
                    .scrollContentBackground(.hidden)
                    .background(.clear)
            }
            
            // Error Text
            if let error = errorMessage {
                Text(error)
                    .font(.system(size: 13, weight: .light))
                    .foregroundColor(.red)
                    .transition(.opacity)
                    .padding(.leading, 8)
            }
        }
        .animation(.easeInOut, value: errorMessage)
    }
}

#Preview {
    CustomTextEditorView(text: .constant(""), errorMessage: .constant(""), placeholder: "")
}
