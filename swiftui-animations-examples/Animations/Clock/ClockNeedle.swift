//
//  ClockNeedle.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 17/05/2025.
//

import SwiftUI

struct ClockNeedle: View {
    let rotation: Angle
    let color: Color
    
    var body: some View {
        HStack(alignment: .center, spacing: .zero) {
            Capsule().fill(color)
            Color.clear
        }
        .frame(height: 3)
        .padding()
        .overlay {
            HStack(alignment: .center, spacing: .zero) {
                Color.clear
                Capsule().fill(color)
                
            }
            .frame(height: 2)
            .frame(width: 12)
            .padding(.all, 1)
            .overlay(content: {
                Circle().fill(color)
            })
        }
        .rotationEffect(rotation, anchor: .center)
    }
}
