//
//  FavouriteView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 25/10/2026.
//

import SwiftUI

struct FavouriteView: View {
    @Environment(\.appTheme) private var theme

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                theme.viewBackgroundColor
                    .ignoresSafeArea()
             
                VStack {
                    Text("Favourite Screen")
                        .font(.largeTitle.bold())
                        .navigationTitle("Favourite")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    FavouriteView()
}
