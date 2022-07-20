//
//  Serializable.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation

/// Serializable protocol
/// - Since: 1.0.0
public protocol Serializable {
    
    /// Serialize
    /// - Returns: Serialized object
    /// - Since: 1.0.0
    func serialized() throws -> Data
}
