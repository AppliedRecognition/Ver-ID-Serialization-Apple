//
//  Size.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation
import CoreGraphics

extension CGSize {
    
    init(_ size: Verid_Size) {
        self.init(width: CGFloat(size.width), height: CGFloat(size.height))
    }
}

extension Verid_Size {
    
    init(_ size: CGSize) {
        self.width = Float(size.width)
        self.height = Float(size.height)
    }
}
