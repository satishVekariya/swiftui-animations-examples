//
//  CircularLineBlinkAnimation.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 17/05/2025.
//

import SwiftUI

public struct CircularLineBlinkAnimation: View {
    var width: CGFloat = 100
    var capsuleCount = 10
    var capsuleWidth: CGFloat = 8
    var cornerRadius: CGFloat = 8
    var colors: [Color] = [
        .clear,
        .clear,
        .clear,
        .orange,
        .clear,
        .clear,
        .clear,
    ]

    public var body: some View {
        TimelineView(.animation) { context in
            let elapsedTime = context.date.timeIntervalSinceReferenceDate
            let rotation = elapsedTime.truncatingRemainder(dividingBy: 1) / 1 * 360 // 4 seconds for full loop
            
            
            Circle()
                .fill(
                    AngularGradient(
                        gradient: Gradient(colors: colors),
                        center: .center,
                        angle: .degrees(rotation)
                    )
                )
                .frame(width: width)
                .mask {
                    ZStack {
                        let radius = (width/2)
                        ForEach(0..<capsuleCount) { index in
                            Capsule()
                                .fill(Color.orange)
                                .frame(width: capsuleWidth, height: radius/1.5)
                                .offset(y: radius/1.5)
                                .rotationEffect(.degrees(Double(index) / Double(capsuleCount) * 360))
                        }
                    }
                }
                .overlay {
                    ZStack {
                        let radius = (width/2)
                        ForEach(0..<capsuleCount) { index in
                            Capsule()
                                .fill(Color.orange.opacity(0.1))
                                .frame(width: capsuleWidth, height: radius/1.5)
                                .offset(y: radius/1.5)
                                .rotationEffect(.degrees(Double(index) / Double(capsuleCount) * 360))
                        }
                    }
                }
        }
    }
}


#Preview {
    CircularLineBlinkAnimation()
}
