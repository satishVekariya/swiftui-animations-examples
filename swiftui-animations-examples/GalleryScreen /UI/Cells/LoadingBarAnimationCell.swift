//
//  LoadingBarAnimationCell.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 18/05/2025.
//


import SwiftUI

public struct LoadingBarAnimationCell: View {
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
            VStack {
                LoadingBarAnimation(width: geometryProxy.size.width * 0.3, height: 16)
                LoadingBarAnimation(width: geometryProxy.size.width * 0.5, height: 32)
                LoadingBarAnimation(width: geometryProxy.size.width * 0.6, height: 45)
                LoadingBarAnimation(width: geometryProxy.size.width * 0.8, height: 60)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.gray, lineWidth: 1)
            }
            .padding(.horizontal, 8)
        }
    }
}
