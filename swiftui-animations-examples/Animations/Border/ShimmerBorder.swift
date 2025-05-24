//
//  ShimmerBorder.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 24/05/2025.
//

import SwiftUI

struct ShimmerBorder: View {
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat = 8
    let borderWidth: CGFloat = 4
    let borderColors = [
        Color.clear,
        .green,
        .clear
    ]
    
    public init(
        width: CGFloat = 300,
        height: CGFloat = 44
    ) {
        self.width = width
        self.height = height
    }
    
    public var body: some View {
        TimelineView(.animation) { context in
            let totalTime = 19.0
            let elapsedTime = context.date.timeIntervalSinceReferenceDate.truncatingRemainder(dividingBy: totalTime)
            let reverse = !(0.0...9.5).contains(elapsedTime)
            let speed: CGFloat = width/(totalTime/6) // pixels per second
            let offsetX = CGFloat(elapsedTime.truncatingRemainder(dividingBy: Double(width / speed))) * speed
            let mappedOffsetX = mapValue(offsetX, from: 0...Double(width), to: -width...width) * (reverse ? -1 : 1)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.black)
                .overlay {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: borderColors,
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .compositingGroup()
                        .offset(x: mappedOffsetX)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: (cornerRadius-borderWidth))
                        .fill(Color.black)
                        .padding(.all, borderWidth)
                }
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .frame(width: width, height: height)
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
    VStack {
        ShimmerBorder()
        ShimmerBorder(width: 200)
        ShimmerBorder(width: 100, height: 38)
        ShimmerBorder(width: 60, height: 28)
    }
}
