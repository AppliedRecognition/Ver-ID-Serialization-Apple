//
//  Image.swift
//  VerIDSerialization
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import Foundation
import VerIDCore

extension Image {
    
    init(_ image: Verid_Image) throws {
        guard let orientation = CGImagePropertyOrientation(rawValue: UInt32(image.orientation)) else {
            throw ImageUtilError.invalidOrientation
        }
        self.init(data: image.data, width: Int(image.width), height: Int(image.height), orientation: orientation, bytesPerRow: Int(image.bytesPerRow), format: try VerIDImageFormat(image.format))
    }
    
}

public extension Image: Serializable {
    
    init(serialized: Data) throws {
        let image = try Verid_Image(serializedData: serialized)
        self.init(image)
    }
    
    func serialized() throws {
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
            return VerIDImageFormatGrayscale
        case .rgb:
            return VerIDImageFormatRGB
        case .bgr:
            return VerIDImageFormatBGR
        case .argb:
            return VerIDImageFormatARGB
        case .abgr:
            return VerIDImageFormatABGR
        case .rgba:
            return VerIDImageFormatRGBA
        case .bgra:
            return VerIDImageFormatBGRA
        default:
            throw ImageUtilError.unsupportedPixelFormat
        }
    }
}

extension Verid_Image.ImageFormat {
    
    init(_ imageFormat: VerIDImageFormat) throws {
        switch imageFormat {
        case VerIDImageFormatGrayscale:
            return .grayscale
        case VerIDImageFormatRGB:
            return .rgb
        case VerIDImageFormatBGR:
            return .bgr
        case VerIDImageFormatARGB:
            return .argb
        case VerIDImageFormatABGR:
            return .abgr
        case VerIDImageFormatRGBA:
            return .rgba
        case VerIDImageFormatBGRA:
            return .bgra
        default:
            throw ImageUtilError.unsupportedPixelFormat
        }
    }
}
