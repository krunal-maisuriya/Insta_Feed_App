//
//  HeaderView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 24/10/2026.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.appColorTheme) private var colorTheme
    @Binding var isCreatePost: Bool
    
    var body: some View {
        HStack {
            Text("Feed")
                .font(.system(size: 28, weight: .bold))
            
            Spacer()

            Button {
                withAnimation {
                    isCreatePost.toggle()
                }
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 22, weight: .medium))
                    .frame(width: 50, height: 50)
                    .overlay {
                        Circle().stroke(colorTheme.gradient, lineWidth: 1)
                    }
            }
            .buttonStyle(.plain)
            .glassEffect(.regular.interactive(), in: Circle())
            
//            Button {
//                
//            } label: {
//                Image(systemName: "person.fill")
//                    .font(.system(size: 22))
////                    .foregroundStyle(.white)
//                    .frame(width: 55, height: 55)
//            }
//            .buttonStyle(.plain)
//            .glassEffect(.regular.interactive(), in: Circle())
        }
        .padding(.bottom, 8)
        .zIndex(1)
    }
}

#Preview {
    HeaderView(isCreatePost: .constant(false))
}
