//
//  ContentView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 24/10/2026.
//

import SwiftUI

enum AppTab: Hashable {
    case home, favourite, profile
}

struct ContentView: View {
    @Environment(\.appColorTheme) private var colorTheme
    
    @State private var selectedTab: AppTab = .home
    
    var body: some View {
        
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(AppTab.home)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
//                FavouriteView()
//                    .tag(AppTab.favourite)
//                    .tabItem {
//                        Image(systemName: "heart")
//                        Text("Favourite")
//                    }
                
                ProfileView()
                    .tag(AppTab.profile)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
            .tint(colorTheme.gradient)
//            .tabBarMinimizeBehavior(.onScrollDown)
        }
    }
}

#Preview {
    ContentView()
}
