//
//  Pie.swift
//  memorize
//
//  Created by Mohamed Ghoneim on 30/12/2025.
//

import SwiftUI
import CoreGraphics

struct Pie: Shape {
    var startAngle = Angle.zero
    let endAngle: Angle
    var clockwise = true
    
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let startAngle = startAngle - .degrees(90)
        let endAngle = endAngle - .degrees(90)
        
        let center = CGPoint(
            x: rect.midX,
            y: rect.midY,
        )
        let radius = min(rect.height, rect.width) / 2
        let start = CGPoint(
            x: center.x + (radius * cos(startAngle.radians)),
            y: center.y + (radius * sin(startAngle.radians)),
        )
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !clockwise,
//            transform: <#T##CGAffineTransform#>
        )
        p.addLine(to: center)
        
        return p
    }
    
    
}
