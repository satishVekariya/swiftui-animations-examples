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
                        case .borderAnimation:
                            BorderAnimationCell(
                                name: item.name
                            )
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                        case .pacmanAnimation:
                            PacmanAnimationCell(
                                name: item.name,
                                geometryProxy: geometry
                            )
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                        case .unknownProgressAnimation:
                            UnknownProgressAnimationCell(
                                name: item.name,
                                geometryProxy: geometry
                            )
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                        case .circularLineBlinkAnimation:
                            CircularLineBlinkAnimationCell(
                                name: item.name,
                                geometryProxy: geometry
                            )
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                        case .threeBallsRotation:
                            ThreeBallsRotationAnimationCell(
                                name: item.name,
                                geometryProxy: geometry
                            )
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                        case .timerAnimation:
                            TimerAnimationCell(
                                name: item.name
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
