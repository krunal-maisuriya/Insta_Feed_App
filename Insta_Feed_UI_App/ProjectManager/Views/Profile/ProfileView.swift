//
//  ProfileView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 25/10/2026.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("appearance")
    private var appearance: AppAppearanceModel = .system

    @Environment(\.appTheme) private var theme
    @Environment(\.appColorTheme) private var colorTheme
    
    @State var isAppearanceView: Bool = false
    @State var isShowThemeAvatarSelector: Bool = false
    @State var isShowEditProfile: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                theme.viewBackgroundColor
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 15) {
                        
                        VStack(alignment: .leading) {
                            ProfileHeaderView(avatarAction: {
                                isShowThemeAvatarSelector.toggle()
                            }, editProfileAction: {
                                isShowEditProfile.toggle()
                            })
                            
                            dividerHorizontal
                        }
                        .padding(.horizontal)
                        .padding(.top, 5)
                        
                        
                        /// User Activity state
                        ActivityStatsView()
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        
                        /// Change Appearances
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Appearance")
                                .font(.system(size: 20, weight: .semibold))
                            
                            HStack {
                                Button {
                                    isAppearanceView.toggle()
                                } label: {
                                    Text("Change Theme")
                                        .font(.system(size: 18, weight: .semibold))
                                        .foregroundStyle(.blue)
                                }
                                
                                Spacer()
                                
                                Text(appearance.title)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                            .padding(.horizontal, 15)
                            .frame(height: 65)
                            .background {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(colorTheme.gradient.opacity(0.05))
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(colorTheme.gradient.opacity(0.5), lineWidth: 2)
                            }
                            .shadow(color: colorTheme.accent.opacity(0.55), radius: 12)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        
                        /// Preferences
                        PreferencesView()
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                        
                        Spacer()
                    }
                }
                .sheet(isPresented: $isAppearanceView) {
                    AppAppearanceView()
                        .presentationDetents([.fraction(0.47)])
                        .preferredColorScheme(theme.colorScheme)
                        .animation(.spring(), value: isAppearanceView)
                }
                .sheet(isPresented: $isShowThemeAvatarSelector) {
                    ChangeAvatarView()
                        .padding()
                        .presentationDetents([.fraction(0.85)])
                        .preferredColorScheme(theme.colorScheme)
                        .presentationDragIndicator(.visible)
                        .animation(.spring(), value: isShowThemeAvatarSelector)
                }
                .fullScreenCover(isPresented: $isShowEditProfile) {
                    EditProfileView()
                        .preferredColorScheme(theme.colorScheme)
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("My Profile")
                            .font(.system(size: 18, weight: .semibold))
//                            .foregroundStyle(theme.colorScheme == .light ? .black : .white)
                    }
                }
            }
        }
    }
    
    private var dividerHorizontal: some View {
        Rectangle()
//            .fill(theme.whiteBlackIconColor.opacity(0.15))
            .opacity(0.15)
            .frame(height: 1)
            .padding(.vertical, 10)
    }
}

#Preview {
    ProfileView()
}
