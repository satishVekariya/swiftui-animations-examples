//
//  BorderAnimation.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 17/05/2025.
//

import SwiftUI

public struct BorderAnimation: View {
    var cornerRadius: CGFloat = 8
    var colors: [Color] = [.yellow, .black, .yellow]

    public var body: some View {
        TimelineView(.animation) { context in
            let elapsedTime = context.date.timeIntervalSinceReferenceDate
            let rotation = elapsedTime.truncatingRemainder(dividingBy: 4) / 4 * 360 // 4 seconds for full loop
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(
                    AngularGradient(
                        gradient: Gradient(colors: colors),
                        center: .center,
                        angle: .degrees(rotation)
                    ),
                    lineWidth: 12
                )
        }
    }
}
