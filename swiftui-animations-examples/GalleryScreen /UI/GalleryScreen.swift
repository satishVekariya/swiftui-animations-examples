//
//  GalleryScreen.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 17/05/2025.
//

import SwiftUI

public struct GalleryScreen: View {
    @State private var model = GalleryScreenModel()
    
    public var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                List {
                    ForEach(model.items) { item in
                        switch item.kind {
                        case .clockAnimation:
                            ClockAnimationCell(
                                name: item.name,
                                geometryProxy: geometry
                            )
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                        }
                    }
                }
                .listStyle(.plain)
                .environment(\.defaultMinListRowHeight, 16)
                .task {
                    await model.load()
                }
                .navigationTitle("Animations")
            }
        }
    }
}

#Preview {
    GalleryScreen()
}
