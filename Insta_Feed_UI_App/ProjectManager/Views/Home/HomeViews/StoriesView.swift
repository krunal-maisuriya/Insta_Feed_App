//
//  StoriesView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 30/10/2026.
//

import SwiftUI

struct StoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 12) {
                VStack(spacing: 10) {
                    Image(systemName: "plus")
                        .font(.system(size: 25, weight: .semibold))
                        .frame(width: 60, height: 60)
                        .background(Circle().fill(Color.gray.gradient.tertiary))
                        .padding(2)
                        .overlay {
                            Circle().stroke(.gray.gradient.opacity(0.6), lineWidth: 3)
                        }
                        .onTapGesture {

                        }
                    
                    Text("Your Story")
                        .font(.system(size: 12, weight: .medium))
                }.padding(.trailing, 10)
                
                ForEach(0..<6) { index in
                    LazyVStack {
                        Image(systemName: "camera.macro")
                            .font(.system(size: 21, weight: .semibold))
                            .frame(width: 60, height: 60)
                            .background(Circle()
                                .fill(gradientColor([.blue.opacity(0.5), .purple.opacity(0.4)])))
                            .padding(5)
                            .overlay {
                                Circle().stroke(gradientColor([.blue, .purple]), lineWidth: 3)
                            }
                        
                        Text("Name")
                            .font(.system(size: 12, weight: .medium))
                    }
                }
            }
            .padding(.bottom, 20)
            .padding(.top, 10)
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    StoriesView()
}
