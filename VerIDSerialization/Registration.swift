//
//  Registration.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 29/06/2022.
//

import Foundation
import VerIDCore
import UIKit

/// Face registration
/// - Since: 1.0.0
public struct Registration: Serializable {
    
    /// Registered faces
    /// - Since: 1.0.0
    public let faces: [Recognizable]
    /// Image of the registered user's face
    /// - Since: 1.0.0
    public let image: UIImage
    /// Info about the system on which the user was registered
    /// - Since:1.0.0
    public let systemInfo: SystemInfo
    
    /// Public initializer
    /// - Parameters:
    ///   - faces: Registered faces
    ///   - image: Image of the registered user's face
    ///   - systemInfo: Info about the system on which the user was registered
    /// - Since: 1.0.0
    public init(faces: [Recognizable], image: UIImage, systemInfo: SystemInfo) throws {
        guard !faces.isEmpty else {
            throw SerializationError.expectedAtLeastOneFace
        }
        self.faces = faces
        self.image = image
        self.systemInfo = systemInfo
    }
    
    /// - Returns: Serialized face registration
    public func serialized() throws -> Data {
        let registration = try Verid_Registration(self)
        return try registration.serializedData()
    }
}

extension Registration {
    
    init(_ registration: Verid_Registration) throws {
        self.faces = try registration.faces.map { faceTemplate in
            try RecognitionFace(recognitionData: faceTemplate.data, version: Int32(faceTemplate.version))
        }
        guard let image = UIImage(data: registration.image) else {
            throw SerializationError.imageDeserializationFailed
        }
        self.image = image
        self.systemInfo = SystemInfo(registration.systemInfo)
    }
}

extension Verid_Registration {
    
    init(_ registration: Registration) throws {
        guard let png = registration.image.pngData() else {
            throw SerializationError.imageSerializationFailed
        }
        self.image = png
        self.faces = registration.faces.map { face in
            Verid_FaceTemplate.with {
                $0.data = face.recognitionData
                $0.version = face.version
            }
        }
        self.systemInfo = Verid_SystemInfo(registration.systemInfo)
    }
}
