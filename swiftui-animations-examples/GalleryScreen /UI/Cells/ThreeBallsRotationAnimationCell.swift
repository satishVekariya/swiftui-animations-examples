//
//  ThreeBallsRotationAnimationCell.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 18/05/2025.
//


import SwiftUI

public struct ThreeBallsRotationAnimationCell: View {
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
                ThreeBallsRotation(width: geometryProxy.size.width * 0.06, spacing: 2)
                Spacer(minLength: 0)
                ThreeBallsRotation(width: geometryProxy.size.width * 0.1, spacing: 4)
                Spacer(minLength: 0)
                ThreeBallsRotation(width: geometryProxy.size.width * 0.2, spacing: 6)
                Spacer(minLength: 0)
                ThreeBallsRotation(width: geometryProxy.size.width * 0.3, spacing: 12)
            }
            .frame(minHeight: geometryProxy.size.width * 0.35)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.gray, lineWidth: 1)
            }
            .padding(.horizontal, 8)
        }
    }
}
