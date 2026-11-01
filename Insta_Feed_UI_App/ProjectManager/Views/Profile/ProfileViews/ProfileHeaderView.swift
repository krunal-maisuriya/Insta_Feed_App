//
//  ProfileHeaderView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 31/10/2026.
//

import SwiftUI

struct ProfileHeaderView: View {
    @AppStorage("avatarIcon") private var avatarIcon = "person.fill"

    @Environment(\.appTheme) private var theme
    @Environment(\.appColorTheme) private var colorTheme
    
    var avatarAction: () -> Void
    var editProfileAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center, spacing: 10) {
                Circle()
                    .fill(colorTheme.selected.gradient)
                    .frame(width: 85, height: 85)
                    .overlay {
                        Image(systemName: avatarIcon)
                            .resizable()
                            .scaledToFill()
                            .foregroundStyle(.white)
                            .frame(width: 30, height: 30)
                    }
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Your name")
                        .font(.system(size: 18, weight: .semibold))
                    
                    Text("Senior iOS Developer")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.gray)
                }
                
                Spacer()
            }
            
            Text("@yourusername")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(colorTheme.accent)
                .underline()
                .padding(.vertical, 2)
                .onTapGesture {
                    print("@yourusername")
                }
            
            Text("Description Description Description Description Description Description fdfjsdf sshfjsdhfshdfjhsfjhsdf sdfsdjkf")
                .font(.system(size: 16, weight: .regular))
                .padding(.bottom, 7)
            
            HStack(spacing: 10) {
                
                Button {
                    avatarAction()
                } label: {
                    Image(systemName: "face.smiling.inverse")
                        .foregroundStyle(.mint)
                    
                    Text("Change Avatar")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.mint)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .background(Capsule().fill(Color.mint.opacity(0.1)))
                .glassEffect(.regular)
                .padding(.top, 8)
                
                Button {
                    editProfileAction()
                } label: {
                    Image(systemName: "pencil")
                        .foregroundStyle(.blue)
                    
                    Text("Edit Profile")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.blue)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .background(Capsule().fill(Color.clear))
                .glassEffect(.regular)
                .padding(.top, 8)
                
                Spacer()
            }
        }

    }
}

#Preview {
    ProfileHeaderView(avatarAction: {}, editProfileAction: {})
}

