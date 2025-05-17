//
//  UnknownProgressAnimation.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 17/05/2025.
//

import SwiftUI

struct UnknownProgressAnimation: View {
    var size: CGFloat = 100
    var primaryColor = Color(red: 1.0, green: 0.5, blue: 0.4)
    var bgColor = Color(red: 0.155, green: 0.041, blue: 0.3)
    var animationCycleTime: CGFloat = 3.5
        
    var body: some View {
        TimelineView(.animation) { context in
            let elapsedTime = context.date.timeIntervalSinceReferenceDate
            let rotation = elapsedTime.truncatingRemainder(dividingBy: 4) / 4 * 360 // 4 seconds for full loop
            
            Circle()
                 .fill(bgColor)
                 .frame(width: size, height: size)
                 .overlay {
                     Circle()
                         .fill(primaryColor)
                         .frame(width: size * 0.62, height: size * 0.62)
                         .overlay {
                             Image(systemName: "questionmark")
                                 .resizable()
                                 .aspectRatio(contentMode: .fill)
                                 .frame(width: size * 0.18, height: size * 0.18)
                                 .fontWeight(.bold)
                         }
                 }
                 .overlay {
                     Circle()
                         .trim(from: 0.0, to: 0.5)
                         .stroke(
                             AngularGradient(
                                 gradient: Gradient(colors: [bgColor, primaryColor]),
                                 center: .center,
                                 startAngle: .degrees(0),
                                 endAngle: .degrees(180)
                             ),
                             style: StrokeStyle(lineWidth: size * 0.09, lineCap: .round)
                         )
                         .rotationEffect(.degrees(rotation))
                         .padding(.all, (size * 0.09)/2)
                 }
                 .clipShape(Circle())
        }
    }
}
