//
//  Capture.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation
import VerIDCore
import UIKit
import SwiftProtobuf

/// Face capture with images and system info
/// - Since: 1.0.0
public struct Capture: Serializable {
    
    /// Date of the capture
    /// - Since: 1.0.0
    public let date: Date
    /// Raw captured image
    /// - Since: 1.0.0
    public let image: Image
    /// Faces captured in the image
    /// - Since: 1.0.0
    public let faces: [RecognizableFace]
    /// `UIImage` version of the captured image
    /// - Since: 1.0.0
    public let uiImage: UIImage
    /// Info about the system on which the image was captured
    /// - Since: 1.0.0
    public let systemInfo: SystemInfo
    
    /// Public initializer
    /// - Parameters:
    ///   - date: Date of the capture
    ///   - image: Raw captured image
    ///   - faces: Faces captured in the image
    ///   - uiImage: `UIImage` version of the captured image
    ///   - systemInfo: Info about the system on which the image was captured
    /// - Since: 1.0.0
    public init(date: Date, image: Image, faces: [RecognizableFace], uiImage: UIImage, systemInfo: SystemInfo) throws {
        guard !faces.isEmpty else {
            throw SerializationError.expectedAtLeastOneFace
        }
        self.date = date
        self.image = image
        self.faces = faces
        self.uiImage = uiImage
        self.systemInfo = systemInfo
    }
    
    /// - Returns: Serialized capture
    /// - Since: 1.0.0
    public func serialized() throws -> Data {
        let capture = try Verid_Capture(self)
        return try capture.serializedData()
    }
}

extension Capture {
    
    init(_ capture: Verid_Capture) throws {
        self.image = try Image(capture.veridImage)
        self.date = capture.date.date
        self.faces = capture.faces.map({ RecognizableFace($0) })
        guard let uiImage = UIImage(data: capture.image) else {
            throw SerializationError.imageDeserializationFailed
        }
        self.uiImage = uiImage
        self.systemInfo = SystemInfo(capture.systemInfo)
    }
}

extension Verid_Capture {
    
    init(_ capture: Capture) throws {
        guard let png = capture.uiImage.pngData() else {
            throw SerializationError.imageSerializationFailed
        }
        guard let face = capture.faces.first else {
            throw SerializationError.expectedAtLeastOneFace
        }
        UIGraphicsBeginImageContext(face.bounds.size)
        defer {
            UIGraphicsEndImageContext()
        }
        capture.uiImage.draw(at: CGPoint(x: 0-face.bounds.minX, y: 0-face.bounds.minY))
        guard let faceImage = UIGraphicsGetImageFromCurrentImageContext() else {
            throw SerializationError.imageCroppingFailed
        }
        guard let facePng = faceImage.pngData() else {
            throw SerializationError.imageSerializationFailed
        }
        let veridImage = try Verid_Image(capture.image)
        self.faces = capture.faces.map { Verid_RecognizableFace($0) }
        self.veridImage = veridImage
        self.image = png
        self.faceImage = facePng
        self.date = Google_Protobuf_Timestamp.init(date: capture.date)
        self.systemInfo = Verid_SystemInfo(capture.systemInfo)
    }
}
