//
//  Face.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation
import VerIDCore

extension Face {
    
    init(_ face: Verid_Face) {
        self.data = face.serialized
        self.bounds = CGRect(face.bounds)
        self.angle = EulerAngle(face.angle)
        self.leftEye = CGPoint(face.leftEye)
        self.rightEye = CGPoint(face.rightEye)
        self.quality = CGFloat(face.quality)
        self.landmarks = face.landmarks.map({ CGPoint($0) })
    }
}

public extension Face: Serializable {
    
    init(serialized: Data) throws {
        self.init(try Verid_Face(serializedData: serialized))
    }
    
    func serialized() throws -> Data {
        Verid_Face(self).serializedData()
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
