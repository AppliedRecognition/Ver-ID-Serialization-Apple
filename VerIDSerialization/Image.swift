//
//  Image.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation
import VerIDCore

extension Image {
    
    convenience init(_ image: Verid_Image) throws {
        guard let orientation = CGImagePropertyOrientation(rawValue: UInt32(image.orientation)) else {
            throw ImageUtilError.invalidOrientation
        }
        self.init(data: image.data, width: Int(image.width), height: Int(image.height), orientation: orientation, bytesPerRow: Int(image.bytesPerRow), format: try VerIDImageFormat(image.format))
    }
    
}

extension Image: Serializable {
    
    public func serialized() throws -> Data {
        try Verid_Image(self).serializedData()
    }
}

extension Verid_Image {
    
    init(_ image: Image) throws {
        self.data = image.data
        self.width = Int32(image.width)
        self.height = Int32(image.height)
        self.orientation = Int32(image.orientation.rawValue)
        self.bytesPerRow = Int32(image.bytesPerRow)
        self.format = try Verid_Image.ImageFormat(image.format)
    }
}

extension VerIDImageFormat {
    
    init(_ imageFormat: Verid_Image.ImageFormat) throws {
        switch imageFormat {
        case .grayscale:
            self = VerIDImageFormatGrayscale
        case .rgb:
            self = VerIDImageFormatRGB
        case .bgr:
            self = VerIDImageFormatBGR
        case .argb:
            self = VerIDImageFormatARGB
        case .abgr:
            self = VerIDImageFormatABGR
        case .rgba:
            self = VerIDImageFormatRGBA
        case .bgra:
            self = VerIDImageFormatBGRA
        default:
            throw ImageUtilError.unsupportedPixelFormat
        }
    }
}

extension Verid_Image.ImageFormat {
    
    init(_ imageFormat: VerIDImageFormat) throws {
        switch imageFormat {
        case VerIDImageFormatGrayscale:
            self = .grayscale
        case VerIDImageFormatRGB:
            self = .rgb
        case VerIDImageFormatBGR:
            self = .bgr
        case VerIDImageFormatARGB:
            self = .argb
        case VerIDImageFormatABGR:
            self = .abgr
        case VerIDImageFormatRGBA:
            self = .rgba
        case VerIDImageFormatBGRA:
            self = .bgra
        default:
            throw ImageUtilError.unsupportedPixelFormat
        }
    }
}
