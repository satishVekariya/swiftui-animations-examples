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
        
        await MainActor.run {
            items = newItems
        }
    }
}
