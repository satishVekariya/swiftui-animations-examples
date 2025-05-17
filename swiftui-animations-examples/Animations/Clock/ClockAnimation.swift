//
//  ClockAnimation.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 17/05/2025.
//

import SwiftUI

public struct ClockAnimation: View {
    let width: CGFloat
    
    public init(width: CGFloat = 100) {
        self.width = width
    }
    
    public var body: some View {
        TimelineView(.animation) { context in
            let elapsedTime = context.date.timeIntervalSince1970
            let rotation1 = elapsedTime.truncatingRemainder(dividingBy: 1) / 1 * 360
            let rotation2 = elapsedTime.truncatingRemainder(dividingBy: 8) / 8 * 360
           
            Circle()
                .strokeBorder(Color.black, lineWidth: 2, antialiased: true)
                .overlay {
                    ClockNeedle(rotation: .degrees(rotation2), color: .blue)
                        .padding(.all, 6)
                }
                .overlay {
                    ClockNeedle(rotation: .degrees(rotation1), color: .orange)
                }
                .frame(width: width, height: width)
        }
    }
}

#Preview {
    ClockAnimation()
}
