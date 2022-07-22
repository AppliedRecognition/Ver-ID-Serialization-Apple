//
//  ImageMetadata.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 21/07/2022.
//

import Foundation
import VerIDCore
import SwiftProtobuf

public struct ImageMetadata: Serializable {
    
    public let date: Date
    public let deviceInfo: DeviceInfo
    
    public init(date: Date, deviceInfo: DeviceInfo) {
        self.date = date
        self.deviceInfo = deviceInfo
    }
    
    public func serialized() throws -> Data {
        return try Verid_ImageMetadata(self).serializedData()
    }
}

extension ImageMetadata {
    
    init(_ imageMetadata: Verid_ImageMetadata) {
        self.date = imageMetadata.date.date
        self.deviceInfo = DeviceInfo(imageMetadata.deviceInfo)
    }
}

extension Verid_ImageMetadata {
    
    init(_ imageMetadata: ImageMetadata) {
        self.date = Google_Protobuf_Timestamp(date: imageMetadata.date)
        self.deviceInfo = Verid_DeviceInfo(imageMetadata.deviceInfo)
    }
}
