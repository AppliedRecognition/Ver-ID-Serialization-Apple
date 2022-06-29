//
//  Deserializer.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 29/06/2022.
//

import Foundation
import VerIDCore

public class Deserializer {
    
    public static func deserialize<T: Serializable>(_ serialized: Data) throws -> T {
        if T.self == RecognizableFace.self {
            let face = try Verid_RecognizableFace(serializedData: serialized)
            return RecognizableFace(face) as! T
        }
        if T.self == Face.self {
            let face = try Verid_Face(serializedData: serialized)
            return Face.init(face) as! T
        }
        if T.self == Image.self {
            let image = try Verid_Image(serializedData: serialized)
            return try Image(image) as! T
        }
        if T.self == Capture.self {
            let capture = try Verid_Capture(serializedData: serialized)
            return try Capture(capture) as! T
        }
        if T.self == Registration.self {
            let registration = try Verid_Registration(serializedData: serialized)
            return try Registration(registration) as! T
        }
        throw SerializationError.deserializationUnavailableForType
    }
}
