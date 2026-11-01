//
//  CloudView.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 31/10/2026.
//

import SwiftUI

struct CloudView: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 40).offset(x: -22, y: 6)
            Circle().frame(width: 52).offset(x: 2, y: -4)
            Circle().frame(width: 36).offset(x: 28, y: 8)
            Capsule().frame(width: 90, height: 28).offset(y: 12)
        }
        .foregroundStyle(.white)
        .blur(radius: 3)
    }
}

#Preview {
    CloudView()
}
