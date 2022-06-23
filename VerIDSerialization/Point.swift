//
//  Point.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation

extension CGPoint {
    
    init(_ point: Verid_Point) {
        self.x = CGFloat(point.x)
        self.y = CGFloat(point.y)
    }
}

extension Verid_Point {
    
    init(_ point: CGPoint) {
        self.x = Float(point.x)
        self.y = Float(point.y)
    }
}
