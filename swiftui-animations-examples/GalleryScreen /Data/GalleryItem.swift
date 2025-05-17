//
//  GalleryItem.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 17/05/2025.
//

import Foundation

public struct GalleryItem: Identifiable {
    public var id: String { kind.hashValue.description }
    public let name: String
    public let kind: GalleryItemKind
}
