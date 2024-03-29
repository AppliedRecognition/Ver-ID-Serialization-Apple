// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: capture.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Verid_Capture {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var date: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._date ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._date = newValue}
  }
  /// Returns true if `date` has been explicitly set.
  var hasDate: Bool {return _storage._date != nil}
  /// Clears the value of `date`. Subsequent reads from it will return its default value.
  mutating func clearDate() {_uniqueStorage()._date = nil}

  var veridImage: Verid_Image {
    get {return _storage._veridImage ?? Verid_Image()}
    set {_uniqueStorage()._veridImage = newValue}
  }
  /// Returns true if `veridImage` has been explicitly set.
  var hasVeridImage: Bool {return _storage._veridImage != nil}
  /// Clears the value of `veridImage`. Subsequent reads from it will return its default value.
  mutating func clearVeridImage() {_uniqueStorage()._veridImage = nil}

  var faces: [Verid_RecognizableFace] {
    get {return _storage._faces}
    set {_uniqueStorage()._faces = newValue}
  }

  var image: Data {
    get {return _storage._image}
    set {_uniqueStorage()._image = newValue}
  }

  var faceImage: Data {
    get {return _storage._faceImage}
    set {_uniqueStorage()._faceImage = newValue}
  }

  var systemInfo: Verid_SystemInfo {
    get {return _storage._systemInfo ?? Verid_SystemInfo()}
    set {_uniqueStorage()._systemInfo = newValue}
  }
  /// Returns true if `systemInfo` has been explicitly set.
  var hasSystemInfo: Bool {return _storage._systemInfo != nil}
  /// Clears the value of `systemInfo`. Subsequent reads from it will return its default value.
  mutating func clearSystemInfo() {_uniqueStorage()._systemInfo = nil}

  var imageMetadata: Verid_ImageMetadata {
    get {return _storage._imageMetadata ?? Verid_ImageMetadata()}
    set {_uniqueStorage()._imageMetadata = newValue}
  }
  /// Returns true if `imageMetadata` has been explicitly set.
  var hasImageMetadata: Bool {return _storage._imageMetadata != nil}
  /// Clears the value of `imageMetadata`. Subsequent reads from it will return its default value.
  mutating func clearImageMetadata() {_uniqueStorage()._imageMetadata = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Verid_Capture: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "verid"

extension Verid_Capture: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Capture"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "date"),
    2: .standard(proto: "verid_image"),
    3: .same(proto: "faces"),
    4: .same(proto: "image"),
    5: .standard(proto: "face_image"),
    6: .standard(proto: "system_info"),
    7: .standard(proto: "image_metadata"),
  ]

  fileprivate class _StorageClass {
    var _date: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
    var _veridImage: Verid_Image? = nil
    var _faces: [Verid_RecognizableFace] = []
    var _image: Data = Data()
    var _faceImage: Data = Data()
    var _systemInfo: Verid_SystemInfo? = nil
    var _imageMetadata: Verid_ImageMetadata? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _date = source._date
      _veridImage = source._veridImage
      _faces = source._faces
      _image = source._image
      _faceImage = source._faceImage
      _systemInfo = source._systemInfo
      _imageMetadata = source._imageMetadata
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every case branch when no optimizations are
        // enabled. https://github.com/apple/swift-protobuf/issues/1034
        switch fieldNumber {
        case 1: try { try decoder.decodeSingularMessageField(value: &_storage._date) }()
        case 2: try { try decoder.decodeSingularMessageField(value: &_storage._veridImage) }()
        case 3: try { try decoder.decodeRepeatedMessageField(value: &_storage._faces) }()
        case 4: try { try decoder.decodeSingularBytesField(value: &_storage._image) }()
        case 5: try { try decoder.decodeSingularBytesField(value: &_storage._faceImage) }()
        case 6: try { try decoder.decodeSingularMessageField(value: &_storage._systemInfo) }()
        case 7: try { try decoder.decodeSingularMessageField(value: &_storage._imageMetadata) }()
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every if/case branch local when no optimizations
      // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
      // https://github.com/apple/swift-protobuf/issues/1182
      try { if let v = _storage._date {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      } }()
      try { if let v = _storage._veridImage {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      } }()
      if !_storage._faces.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._faces, fieldNumber: 3)
      }
      if !_storage._image.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._image, fieldNumber: 4)
      }
      if !_storage._faceImage.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._faceImage, fieldNumber: 5)
      }
      try { if let v = _storage._systemInfo {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      } }()
      try { if let v = _storage._imageMetadata {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
      } }()
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Verid_Capture, rhs: Verid_Capture) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._date != rhs_storage._date {return false}
        if _storage._veridImage != rhs_storage._veridImage {return false}
        if _storage._faces != rhs_storage._faces {return false}
        if _storage._image != rhs_storage._image {return false}
        if _storage._faceImage != rhs_storage._faceImage {return false}
        if _storage._systemInfo != rhs_storage._systemInfo {return false}
        if _storage._imageMetadata != rhs_storage._imageMetadata {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
