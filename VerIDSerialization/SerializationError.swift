//
//  SerializationError.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 29/06/2022.
//

import Foundation

/// Errors thrown during serialization and deserialization
/// - Since: 1.0.0
public enum SerializationError: Int, Error {
    
    /// Image deserialization failed
    case imageDeserializationFailed
    /// Image serialization failed
    case imageSerializationFailed
    /// Empty faces array passed to a method that expected at least one face
    case expectedAtLeastOneFace
    /// Cropping of image failed
    case imageCroppingFailed
    /// Attempted to deserialize a type for which deserialization is not available
    case deserializationUnavailableForType
}
