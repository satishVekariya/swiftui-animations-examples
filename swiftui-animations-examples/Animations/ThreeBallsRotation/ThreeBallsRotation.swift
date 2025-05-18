//
//  ThreeBallsRotation.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 18/05/2025.
//

import SwiftUI

public struct ThreeBallsRotation: View {
    let width: CGFloat
    let spacing: CGFloat
    
    public init(width: CGFloat = 100, spacing: CGFloat = 4) {
        self.width = width
        self.spacing = spacing
    }
    
    public var body: some View {
        TimelineView(.animation) { context in
            let t = context.date.timeIntervalSince1970
            
            // Ease: Accel → Deaccel → Accel → Deaccel
            // Adjust 0.1 to control strength of the effect
            let warpedT = t + sin(t * 4 * .pi) * 0.08
            
            // Keep it in [0, 1]
            let normalizedT = warpedT.truncatingRemainder(dividingBy: 1)
            let rotation = normalizedT * 360 + 90
            
            HStack(spacing: spacing) {
                Circle().frame(width: width / 3)
                Circle().frame(width: width / 3)
                Circle().frame(width: width / 3)
            }
            .foregroundStyle(Color.blue)
            .rotationEffect(.degrees(rotation))
        }
    }
}

#Preview {
    ThreeBallsRotation()
}
