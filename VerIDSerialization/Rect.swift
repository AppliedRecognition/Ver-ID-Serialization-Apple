//
//  Rect.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation

extension CGRect {
    
    init(_ rect: Verid_Rect) {
        self.init(origin: CGPoint(rect.origin), size: CGSize(rect.size))
    }
}

extension Verid_Rect {
    
    init(_ rect: CGRect) {
        self.origin = Verid_Point(rect.origin)
        self.size = Verid_Size(rect.size)
    }
}
