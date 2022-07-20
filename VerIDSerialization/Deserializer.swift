//
//  Deserializer.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 29/06/2022.
//

import Foundation
import VerIDCore

/// Deserializer
/// - Since: 1.0.0
public class Deserializer {
    
    /// Deserialize common Ver-ID types
    ///
    /// Types that can be deserialized are:
    ///
    /// - `Face`
    /// - `RecognizableFace`
    /// - `Image`
    /// - `Capture`*
    /// - `Registration`*
    /// - `SystemInfo`
    ///
    /// **`Capture` and `Registration` are types introduced by VerIDSerialization framework*
    /// - Parameter serialized: Serialized object
    /// - Returns: Deserialized object
    /// - Since: 1.0.0
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
        if T.self == SystemInfo.self {
            let systemInfo = try Verid_SystemInfo(serializedData: serialized)
            return SystemInfo(systemInfo) as! T
        }
        throw SerializationError.deserializationUnavailableForType
    }
}
