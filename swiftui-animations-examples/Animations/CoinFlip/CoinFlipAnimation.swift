//
//  CoinFlipAnimation.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 07/06/2025.
//


import SwiftUI

public struct CoinFlipAnimation: View {
    let width: CGFloat
    let time: TimeInterval = 2
    
    public init(width: CGFloat = 100) {
        self.width = width
    }
    
    public var body: some View {
        TimelineView(.animation) { context in
            let elapsedTime = context.date.timeIntervalSince1970
            let rotation = elapsedTime.truncatingRemainder(dividingBy: time) / time * 360
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: width, height: width)
                .rotation3DEffect(
                    Angle(degrees: rotation),
                    axis: (x: 0, y: 1, z: 0), // Flip around horizontal axis
                    perspective: 0.6
                )
        }
    }
}

#Preview {
    CoinFlipAnimation()
}
