//
//  VerIDSerializationTests.swift
//  VerIDSerializationTests
//
//  Created by Jakub Dolejs on 23/06/2022.
//

import XCTest
import VerIDCore
@testable import VerIDSerialization

class VerIDSerializationTests: XCTestCase {

    func testSerializeFace() throws {
        let face = self.generateVerIDFace()
        XCTAssertNoThrow(try face.serialized())
    }
    
    func testDeserializeFace() throws {
        let face = self.generateVerIDFace()
        let serialized = try face.serialized()
        let deserialized: Face = try Deserializer.deserialize(serialized)
        XCTAssertEqual(face.bounds.minX, deserialized.bounds.minX, accuracy: 0.01)
        XCTAssertEqual(face.bounds.minY, deserialized.bounds.minY, accuracy: 0.01)
        XCTAssertEqual(face.bounds.width, deserialized.bounds.width, accuracy: 0.01)
        XCTAssertEqual(face.bounds.height, deserialized.bounds.height, accuracy: 0.01)
        XCTAssertEqual(face.angle.yaw, deserialized.angle.yaw, accuracy: 0.01)
        XCTAssertEqual(face.angle.pitch, deserialized.angle.pitch, accuracy: 0.01)
        XCTAssertEqual(face.angle.roll, deserialized.angle.roll, accuracy: 0.01)
        XCTAssertEqual(face.quality, deserialized.quality, accuracy: 0.01)
        XCTAssertEqual(face.landmarks.count, deserialized.landmarks.count)
    }
    
    func testSerializeImage() throws {
        let image = self.generateImage()
        XCTAssertNoThrow(try image.serialized())
    }
    
    func testDeserializeImage() throws {
        let image = self.generateImage()
        let serialized = try image.serialized()
        let deserialized: Image = try Deserializer.deserialize(serialized)
        XCTAssertEqual(image.data.count, deserialized.data.count)
        XCTAssertEqual(image.data, deserialized.data)
        XCTAssertEqual(image.width, deserialized.width)
        XCTAssertEqual(image.height, deserialized.height)
        XCTAssertEqual(image.bytesPerRow, deserialized.bytesPerRow)
        XCTAssertEqual(image.orientation, deserialized.orientation)
        XCTAssertEqual(image.format, deserialized.format)
    }
    
    func testSerializeRecognizableFace() throws {
        let face = try self.generateRecognizableFace()
        XCTAssertNoThrow(try face.serialized())
    }
    
    func testDeserializeRecognizableFace() throws {
        let face = try self.generateRecognizableFace()
        let serialized = try face.serialized()
        let deserialized: RecognizableFace = try Deserializer.deserialize(serialized)
        XCTAssertEqual(face.bounds.minX, deserialized.bounds.minX, accuracy: 0.01)
        XCTAssertEqual(face.bounds.minY, deserialized.bounds.minY, accuracy: 0.01)
        XCTAssertEqual(face.bounds.width, deserialized.bounds.width, accuracy: 0.01)
        XCTAssertEqual(face.bounds.height, deserialized.bounds.height, accuracy: 0.01)
        XCTAssertEqual(face.angle.yaw, deserialized.angle.yaw, accuracy: 0.01)
        XCTAssertEqual(face.angle.pitch, deserialized.angle.pitch, accuracy: 0.01)
        XCTAssertEqual(face.angle.roll, deserialized.angle.roll, accuracy: 0.01)
        XCTAssertEqual(face.quality, deserialized.quality, accuracy: 0.01)
        XCTAssertEqual(face.landmarks.count, deserialized.landmarks.count)
        XCTAssertEqual(face.recognitionData.count, deserialized.recognitionData.count)
        XCTAssertEqual(face.recognitionData, deserialized.recognitionData)
        XCTAssertEqual(face.faceTemplateVersion, deserialized.faceTemplateVersion)
    }
    
    @available(iOS 13, *)
    func testSerializeCapture() throws {
        let capture = try self.generateCapture()
        XCTAssertNoThrow(try capture.serialized())
    }
    
    @available(iOS 13, *)
    func testDeserializeCapture() throws {
        let capture = try self.generateCapture()
        let serialized = try capture.serialized()
        let deserialized: Capture = try Deserializer.deserialize(serialized)
        XCTAssertEqual(capture.date.compare(deserialized.date), .orderedSame)
        XCTAssertEqual(capture.image.data.count, deserialized.image.data.count)
        XCTAssertEqual(capture.image.data, deserialized.image.data)
        XCTAssertEqual(capture.image.width, deserialized.image.width)
        XCTAssertEqual(capture.image.height, deserialized.image.height)
        XCTAssertEqual(capture.image.bytesPerRow, deserialized.image.bytesPerRow)
        XCTAssertEqual(capture.image.orientation, deserialized.image.orientation)
        XCTAssertEqual(capture.image.format, deserialized.image.format)
        XCTAssertEqual(capture.faces.count, deserialized.faces.count)
    }
    
    private func generateVerIDFace() -> Face {
        let face = Face()
        face.bounds = CGRect(x: 10, y: 20, width: 30, height: 45)
        face.angle = EulerAngle(yaw: 1.5, pitch: 0.5, roll: 0.2)
        face.landmarks = [CGPoint](repeating: CGPoint(x: 1.2, y: 2.1), count: 68)
        face.data = Data(repeating: 0, count: 176)
        face.quality = 9
        return face
    }
    
    private func generateRecognizableFace() throws -> RecognizableFace {
        let face = self.generateVerIDFace()
        return RecognizableFace(face: face, recognitionData: Data(repeating: 1, count: 176), version: try VerIDFaceTemplateVersion.V20.serialNumber(encryptionEnabled: false))
    }
    
    private func generateImage() -> Image {
        let width = 200
        let height = 300
        let bytesPerRow = width * 4
        return Image(data: Data(repeating: 0xFF, count: bytesPerRow * height), width: width, height: height, orientation: .up, bytesPerRow: bytesPerRow, format: VerIDImageFormatARGB)
    }

    @available(iOS 13, *)
    private func generateCapture() throws -> Capture {
        guard let image = UIImage(systemName: "face.smiling") else {
            throw SerializationError.imageSerializationFailed
        }
        return try Capture(date: Date(), image: self.generateImage(), faces: [try self.generateRecognizableFace()], uiImage: image, systemInfo: SystemInfo.init(deviceInfo: DeviceInfo(), veridVersion: "2.6.0", veridSettings: DetRecLibSettings(), faceDetectionClassName: "VerIDFaceDetection", faceRecognitionClassName: "VerIDFaceRecognition", userManagementClassName: "VerIDUserManagement", defaultFaceTemplateVersion: "V20"))
    }
}
