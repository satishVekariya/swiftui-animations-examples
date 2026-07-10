//
//  HalftoneDotsAnimation.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 10/07/2025.
//

import SwiftUI

/// An animated halftone dot field rendered on the GPU.
///
/// `TimelineView(.animation)` supplies a per-frame clock, which is handed to a
/// Metal `colorEffect` shader (`halftoneDots`) as a `time` uniform. The shader
/// draws a grid of dots whose size and opacity are driven by a slowly drifting
/// fractal field, so the "blobs" wander smoothly. The gaps between dots are
/// transparent, so the view composites over any background you place behind it.
public struct HalftoneDotsAnimation: View {
    private let startDate = Date()

    public init() {}

    public var body: some View {
        TimelineView(.animation) { context in
            // Elapsed seconds, wrapped to keep float precision high over time.
            let time = context.date.timeIntervalSince(startDate)
                .truncatingRemainder(dividingBy: 1000)

            GeometryReader { proxy in
                Rectangle()
                    .fill(.black) // Ignored by the shader; guarantees full coverage.
                    .colorEffect(
                        ShaderLibrary.halftoneDots(
                            .float2(proxy.size),
                            .float(Float(time))
                        )
                    )
            }
        }
    }
}

#Preview {
    HalftoneDotsAnimation()
        .frame(width: 370, height: 179)
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.09, green: 0.08, blue: 0.16),
                    Color(red: 0.16, green: 0.14, blue: 0.24)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding()
}
