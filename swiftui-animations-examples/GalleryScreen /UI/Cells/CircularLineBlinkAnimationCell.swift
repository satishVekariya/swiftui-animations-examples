//
//  CircularLineBlinkAnimationCell.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 17/05/2025.
//

import SwiftUI

import SwiftUI

public struct CircularLineBlinkAnimationCell: View {
    let name: String
    let geometryProxy: GeometryProxy
    
    public init(
        name: String,
        geometryProxy: GeometryProxy
    ) {
        self.name = name
        self.geometryProxy = geometryProxy
    }
    
    public var body: some View {
        Group {
            Text(name)
                .font(.body)
                .padding(.horizontal, 8)
            HStack {
                CircularLineBlinkAnimation(width: geometryProxy.size.width * 0.1, capsuleWidth: 4)
                Spacer(minLength: 0)
                CircularLineBlinkAnimation(width: geometryProxy.size.width * 0.15, capsuleWidth: 6)
                Spacer(minLength: 0)
                CircularLineBlinkAnimation(width: geometryProxy.size.width * 0.25, capsuleWidth: 8)
                Spacer(minLength: 0)
                CircularLineBlinkAnimation(width: geometryProxy.size.width * 0.35, capsuleWidth: 10)
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
