//
//  Capture.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation
import VerIDCore
import UIKit

public struct Capture: Serializable {
    
    public let date: Date
    public let image: Image
    public let faces: [RecognizableFace]
    public let uiImage: UIImage
    public let systemInfo: SystemInfo
    
    public init(date: Date, image: Image, faces: [RecognizableFace], uiImage: UIImage, systemInfo: SystemInfo) {
        self.date = date
        self.image = image
        self.faces = faces
        self.uiImage = uiImage
        self.systemInfo = systemInfo
    }
    
    public init(serialized: Data) throws {
        let capture = try Verid_Capture(serializedData: serialized)
        try self.init(capture)
    }
    
    public func serialized() throws -> Data {
        guard let capture = Verid_Capture(self) else {
            throw NSError()
        }
        return capture.serializedData()
    }
}

extension Capture {
    
    init(_ capture: Verid_Capture) throws {
        self.image = Image(capture.veridImage)
        self.date = Date(timeIntervalSince1970: capture.date / 1000)
        self.faces = capture.faces.map({ RecognizableFace($0) })
        guard let uiImage = UIImage(data: capture.image) else {
            throw NSError()
        }
        self.uiImage = uiImage
        self.systemInfo = SystemInfo(capture.systemInfo)
    }
}

extension Verid_Capture {
    
    init?(_ capture: Capture) {
        guard let png = capture.uiImage.pngData() else {
            return nil
        }
        guard let face = capture.faces.first else {
            return nil
        }
        UIGraphicsBeginImageContext(face.bounds.size)
        defer {
            UIGraphicsEndImageContext()
        }
        capture.uiImage.draw(at: CGPoint(x: 0-face.bounds.minX, y: 0-face.bounds.minY))
        guard let faceImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        guard let facePng = faceImage.pngData() else {
            return nil
        }
        guard let veridImage = try? Verid_Image(capture.image) else {
            return nil
        }
        self.faces = capture.faces.map { Verid_RecognizableFace($0) }
        self.veridImage = veridImage
        self.image = png
        self.faceImage = facePng
        self.date = capture.date.timeIntervalSince1970 / 1000
        self.systemInfo = Verid_SystemInfo(capture.systemInfo)
    }
}
