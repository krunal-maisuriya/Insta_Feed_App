//
//  TiltTooltipView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 28/10/2026.
//

import SwiftUI
import UIKit
import Foundation

struct TiltTooltipView: View {
    var closeAction: () -> ()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "globe")
                    .font(.system(size: 30, weight: .regular))
                    .foregroundStyle(.cyan)
                    
                VStack(alignment: .leading, spacing: 0) {
                    Text("3D Tilt")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)

                    Text("Touch and drag a feed card to see it tilt.")
                        .font(.system(size: 13))
                        .foregroundStyle(.white.opacity(0.55))
                        .fixedSize(horizontal: false, vertical: true)
                }
                    
                Spacer(minLength: 0)
                    
                Button {
                    withAnimation(.spring(duration: 0.3)) { closeAction() }
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundStyle(.white.opacity(0.8))
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.12), in: Circle())
                }
            }
            .padding(10)
            .shadow(radius: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    TiltTooltipView(closeAction: {})
}
