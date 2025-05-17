//
//  PacmanAnimationCell.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 17/05/2025.
//


import SwiftUI

public struct PacmanAnimationCell: View {
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
                PacManAnimation(width: geometryProxy.size.width * 0.1)
                Spacer(minLength: 0)
                PacManAnimation(width: geometryProxy.size.width * 0.15)
                Spacer(minLength: 0)
                PacManAnimation(width: geometryProxy.size.width * 0.25)
                Spacer(minLength: 0)
                PacManAnimation(width: geometryProxy.size.width * 0.35)
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
