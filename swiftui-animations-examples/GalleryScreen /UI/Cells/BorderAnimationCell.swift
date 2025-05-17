//
//  BorderAnimationCell.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 17/05/2025.
//

import SwiftUI

public struct BorderAnimationCell: View {
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
                Image(systemName: "gift.fill")
                    .font(.system(size: 16))
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.yellow)
                            .padding(5)
                            .background(BorderAnimation())
                    }
                
                Spacer(minLength: 0)
                
                Image(systemName: "giftcard.fill")
                    .font(.system(size: 65))
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.purple)
                            .padding(5)
                            .background {
                                BorderAnimation(colors: [.purple, .black, .purple])
                            }
                    }
                
                Spacer(minLength: 0)
                
                
                Image(systemName: "gift.circle.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.pink)
                    .background {
                        Circle()
                            .fill(.clear)
                            .padding(5)
                            .background {
                                BorderAnimation(cornerRadius: 45, colors: [.pink, .black, .pink])
                            }
                    }
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
