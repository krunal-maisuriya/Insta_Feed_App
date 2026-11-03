//
//  HomeView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 25/10/2026.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.appTheme) private var theme
    @Environment(\.appColorTheme) private var colorTheme
    
    @State private var feedViewModel = FeedViewModel()
    
    
    @State private var isShowTooltip: Bool = false
    @State private var selectedIndex: Int? = nil
    
    @State private var isTapCreatePost: Bool = false
        
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                theme.viewBackgroundColor
                    .ignoresSafeArea()

                Group {
                    if feedViewModel.isLoading {
                        ProgressView("Loading posts...")
                    }
                    else if let error = feedViewModel.errorMessage {
//                    else if feedViewModel.errorMessage != "" {
                        ContentUnavailableView("Something went wrong", systemImage: "exclamationmark.triangle", description: Text(error))
//                        ContentUnavailableView("Something went wrong", systemImage: "exclamationmark.triangle", description: Text(feedViewModel.errorMessage ?? ""))
                    }
                    else if feedViewModel.posts.isEmpty {
                        ContentUnavailableView("No Posts", systemImage: "text.bubble", description: Text("Create your first post!"))
                    }
                    else {
                        ScrollView(showsIndicators: false) {
                            LazyVStack(alignment: .leading, spacing: 24) {
        //                         StoriesView()
                                
                                ForEach(Array(feedViewModel.posts.enumerated()), id: \.element.id) { index, post in
                                    
                                    TiltCardView(post: .constant(post))
                                        .padding(.horizontal, 15)
                                        .onTapGesture {
                                            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                                selectedIndex = index
                                                isShowTooltip = true
                                                print("isShowTooltip -->", isShowTooltip)
                                            }
                                        }
                                        .popover(isPresented: Binding(
                                            get: { isShowTooltip && selectedIndex == index },
                                            set: { isPresented in
                                                if !isPresented && selectedIndex == index {
                                                    isShowTooltip = false
                                                    selectedIndex = nil
                                                }
                                            }), arrowEdge: .bottom
                                        ) {
                                            TiltTooltipView {
                                                isShowTooltip = false
                                                selectedIndex = nil
                                            }
                                            .presentationCompactAdaptation(.popover)
                                        }
                                }
                            }
                            .padding(.top, 90)
                            .padding(.bottom, 24)
                        }
                    }
                }
                
                HeaderView(isCreatePost: $isTapCreatePost)
                    .padding(.horizontal)
            }
            .task {
                await feedViewModel.fetchPosts()
            }
            .refreshable {
                await feedViewModel.fetchPosts()
            }
            .fullScreenCover(isPresented: $isTapCreatePost) {
                CreateFeedView(feedViewModel: feedViewModel)
                    .presentationDetents([.fraction(0.73)])
                    .interactiveDismissDisabled(true)
                    .animation(.spring(), value: isTapCreatePost)
            }
        }
    }
}

#Preview {
    HomeView()
}


var backgroundLinearColor = LinearGradient(
    colors: [
        Color(red: 0.015, green: 0.035, blue: 0.12),
        Color(red: 0.025, green: 0.10, blue: 0.34),
        Color(red: 0.015, green: 0.035, blue: 0.13)
    ],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)


func backgroundShapesView() -> some View {
    return GeometryReader { proxy in
        ZStack {
            
            // Blue glow behind the heading
            RadialGlowGradientView(
                colors: [
                    Color.blue.opacity(0.65),
                    Color.indigo.opacity(0.28), .clear
                ],
                startRadius: 5, endRadius: 190,
                size: CGSize(width: 380, height: 380),
                xPosition: 0.60, yPosition: 0.20,
            )
            
            // Purple ambient glow
            RadialGlowGradientView(
                colors: [
                    Color.purple.opacity(0.30),
                    Color.blue.opacity(0.22), .clear
                ],
                startRadius: 5, endRadius: 160,
                size: CGSize(width: 320, height: 320),
                xPosition: 0.90, yPosition: 0.32,
            )
            
            
            // Glowing glass orb
            GlassOrbView()
                .frame(width: 205, height: 205)
                .position(
                    x: proxy.size.width * 0.86,
                    y: proxy.size.height * 0.25
                )
        }
        .frame(width: proxy.size.width, height: proxy.size.height)
        .clipped()
        .ignoresSafeArea()
    }
}
