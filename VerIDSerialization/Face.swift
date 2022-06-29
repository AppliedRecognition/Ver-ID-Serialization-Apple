//
//  Face.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation
import VerIDCore

extension Face {
    
    convenience init(_ face: Verid_Face) {
        self.init()
        self.data = face.serialized
        self.bounds = CGRect(face.bounds)
        self.angle = EulerAngle(face.angle)
        self.leftEye = CGPoint(face.leftEye)
        self.rightEye = CGPoint(face.rightEye)
        self.quality = CGFloat(face.quality)
        self.landmarks = face.landmarks.map({ CGPoint($0) })
    }
}

extension Face: Serializable {
    
    public func serialized() throws -> Data {
        switch self {
        case is RecognizableFace:
            return try Verid_RecognizableFace(self as! RecognizableFace).serializedData()
        default:
            return try Verid_Face(self).serializedData()
        }
    }
}

extension Verid_Face {
    
    init(_ face: Face) {
        self.bounds = Verid_Rect(face.bounds)
        self.angle = Verid_EulerAngle(face.angle)
        self.quality = Float(face.quality)
        self.leftEye = Verid_Point(face.leftEye)
        self.rightEye = Verid_Point(face.rightEye)
        self.landmarks = face.landmarks.map({ Verid_Point($0) })
        self.serialized = face.data
    }
}
