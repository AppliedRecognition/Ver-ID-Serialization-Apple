//
//  Serializable.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation

public protocol Serializable {

    func serialized() throws -> Data
}
