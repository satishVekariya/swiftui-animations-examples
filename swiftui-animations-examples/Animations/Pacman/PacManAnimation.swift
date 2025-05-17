//
//  PacManAnimation.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 17/05/2025.
//

import SwiftUI

public struct PacManAnimation: View {
    var width: CGFloat = 150
    
    public var body: some View {
        TimelineView(.animation) { timeline in
            let time = timeline.date.timeIntervalSinceReferenceDate
            let phase = abs(sin(time * 4)) // Controls the mouth open/close

            PacManShape(mouthAngle: phase * 0.1) // Max mouth opening = 25%
                .fill(Color.yellow)
                .frame(width: width, height: width)
                .rotationEffect(.degrees(0)) // Rotate to face right
                .overlay {
                    Circle()
                        .frame(width: width * 0.08)
                        .offset(x: width * 0.16, y: -width * 0.35 )
                        .offset(x: -(width * (0.1 * phase)) )
                }
        }
    }
}

struct PacManShape: Shape {
    var mouthAngle: CGFloat // Between 0 and 0.25

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)

        let startAngle = Angle(degrees: Double(mouthAngle) * 360)
        let endAngle = Angle(degrees: Double(1 - mouthAngle) * 360)

        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: false)
        path.addLine(to: center)
        path.closeSubpath()
        return path
    }

    var animatableData: CGFloat {
        get { mouthAngle }
        set { mouthAngle = newValue }
    }
}

#Preview {
    PacManAnimation()
}
