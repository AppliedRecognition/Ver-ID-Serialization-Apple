//
//  EulerAngle.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation
import VerIDCore

extension EulerAngle {
    
    init(_ angle: Verid_EulerAngle) {
        self.yaw = CGFloat(angle.yaw)
        self.pitch = CGFloat(angle.pitch)
        self.roll = CGFloat(angle.roll)
    }
}

extension Verid_EulerAngle {
    
    init(_ angle: EulerAngle) {
        self.yaw = Float(angle.yaw)
        self.pitch = Float(angle.pitch)
        self.roll = Float(angle.roll)
    }
}
