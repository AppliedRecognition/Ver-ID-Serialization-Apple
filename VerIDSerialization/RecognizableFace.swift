//
//  RecognizableFace.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation
import VerIDCore

extension RecognizableFace {
    
    init(_ face: Verid_RecognizableFace) {
        self.init(face: Face(face.face), recognitionData: face.template.data, version: face.template.version)
    }
}

public extension RecognizableFace: Serializable {
    
    init(serialized: Data) throws {
        self.init(try Verid_RecognizableFace(serializedData: serialized))
    }
    
    func serialized() throws -> Data {
        try Verid_RecognizableFace(self).serializedData()
    }
}

extension Verid_RecognizableFace {
    
    init(_ face: RecognizableFace) {
        self.face = Verid_Face(face)
        self.template = Verid_FaceTemplate.with {
            $0.data = face.recognitionData
            $0.version = face.version
        }
    }
}
