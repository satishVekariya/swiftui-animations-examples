//
//  HalftoneDotsAnimationCell.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 10/07/2025.
//

import SwiftUI

public struct HalftoneDotsAnimationCell: View {
    let name: String

    public init(name: String) {
        self.name = name
    }

    public var body: some View {
        Group {
            Text(name)
                .font(.body)
                .padding(.horizontal, 8)
            HalftoneDotsAnimation()
                .frame(height: 160)
                .frame(maxWidth: .infinity)
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
                .padding(.horizontal, 8)
        }
    }
}
