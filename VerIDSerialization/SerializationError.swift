//
//  SerializationError.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 29/06/2022.
//

import Foundation

public enum SerializationError: Int, Error {
    
    case imageDeserializationFailed, imageSerializationFailed, expectedAtLeastOneFace, imageCroppingFailed, deserializationUnavailableForType
}
