//
//  TimerAnimationCell.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 18/05/2025.
//


import SwiftUI

public struct TimerAnimationCell: View {
    let name: String
    
    public init(
        name: String,
    ) {
        self.name = name
    }
    
    public var body: some View {
        Group {
            Text(name)
                .font(.body)
                .padding(.horizontal, 8)
            HStack {
                Spacer(minLength: 0)
                TimerAnimation()
                Spacer(minLength: 0)
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.gray, lineWidth: 1)
            }
            .padding(.horizontal, 8)
        }
    }
}
