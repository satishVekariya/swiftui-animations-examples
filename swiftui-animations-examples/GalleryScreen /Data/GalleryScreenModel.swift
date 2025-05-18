//
//  GalleryScreenModel.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 17/05/2025.
//

import Foundation
import Observation

@MainActor
@Observable
public class GalleryScreenModel {
    public private(set) var items: [GalleryItem] = []
    
    public init() {
    }
    
    @BackgroundActor
    public func load() async {
        var newItems: [GalleryItem] = []
        let clockItem = GalleryItem(name: "Clock Animation", kind: .clockAnimation)
        newItems.append(clockItem)
        let pacemanItem = GalleryItem(name: "Pac-Man Animation", kind: .pacmanAnimation)
        newItems.append(pacemanItem)
        let unknownProgressItem = GalleryItem(name: "Unknown Progress Animation", kind: .unknownProgressAnimation)
        newItems.append(unknownProgressItem)
        let circularLineBlinkItem = GalleryItem(name: "Circle Progress Animation", kind: .circularLineBlinkAnimation)
        newItems.append(circularLineBlinkItem)
        let borderItem = GalleryItem(name: "Border Animation", kind: .borderAnimation)
        newItems.append(borderItem)
        let threeBallsItem = GalleryItem(name: "Three Balls Rotation Animation", kind: .threeBallsRotation)
        newItems.append(threeBallsItem)
        let timerAnimationItem = GalleryItem(name: "Timer Animation", kind: .timerAnimation)
        newItems.append(timerAnimationItem)
        
        
        await MainActor.run {
            items = newItems
        }
    }
}
