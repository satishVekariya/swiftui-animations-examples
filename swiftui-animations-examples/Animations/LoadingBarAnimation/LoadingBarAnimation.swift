//
//  LoadingBarAnimation.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 18/05/2025.
//

import SwiftUI

struct LoadingBarAnimation: View {
    let width: CGFloat
    let height: CGFloat
    
    public init(
        width: CGFloat = 300,
        height: CGFloat = 60
    ) {
        self.width = width
        self.height = height
    }
    
    public var body: some View {
        TimelineView(.animation) { context in
            let elapsedTime = context.date.timeIntervalSinceReferenceDate
            let speed: CGFloat = width // pixels per second
            let offsetX = CGFloat(elapsedTime.truncatingRemainder(dividingBy: Double(width / speed))) * speed
            let barWidth = width
            let mappedOffsetX = mapValue(offsetX, from: 0...Double(width), to: -barWidth...width)
            
            Rectangle()
                .fill(.red)
                .overlay {
                    Rectangle()
                        .fill(Color.black)
                        .offset(x: mappedOffsetX)
                }
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
    
    private func mapValue(_ value: Double, from inputRange: ClosedRange<Double>, to outputRange: ClosedRange<Double>) -> Double {
        let inputMin = inputRange.lowerBound
        let inputMax = inputRange.upperBound
        let outputMin = outputRange.lowerBound
        let outputMax = outputRange.upperBound
        
        return (value - inputMin) / (inputMax - inputMin) * (outputMax - outputMin) + outputMin
    }
}

#Preview {
    LoadingBarAnimation()
}
