//
//  HillsShape.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 31/10/2026.
//

import SwiftUI

struct Hill: Shape {
    var phase: Double
    var amplitude: Double // fraction of height
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.height))
        let steps = 60
        
        for i in 0...steps {
            let x = rect.width * CGFloat(i) / CGFloat(steps)
            let t = Double(i) / Double(steps) * .pi * 2 + phase
            let y = rect.height * (0.35 + amplitude * sin(t))
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}
