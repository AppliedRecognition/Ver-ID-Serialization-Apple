// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: image.proto
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

struct Verid_Image {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var data: Data = Data()

  var width: Int32 = 0

  var height: Int32 = 0

  var bytesPerRow: Int32 = 0

  var orientation: Int32 = 0

  var format: Verid_Image.ImageFormat = .grayscale

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum ImageFormat: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case grayscale // = 0
    case rgb // = 1
    case bgr // = 2
    case rgba // = 3
    case bgra // = 4
    case argb // = 5
    case abgr // = 6
    case UNRECOGNIZED(Int)

    init() {
      self = .grayscale
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .grayscale
      case 1: self = .rgb
      case 2: self = .bgr
      case 3: self = .rgba
      case 4: self = .bgra
      case 5: self = .argb
      case 6: self = .abgr
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .grayscale: return 0
      case .rgb: return 1
      case .bgr: return 2
      case .rgba: return 3
      case .bgra: return 4
      case .argb: return 5
      case .abgr: return 6
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension Verid_Image.ImageFormat: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Verid_Image.ImageFormat] = [
    .grayscale,
    .rgb,
    .bgr,
    .rgba,
    .bgra,
    .argb,
    .abgr,
  ]
}

#endif  // swift(>=4.2)

#if swift(>=5.5) && canImport(_Concurrency)
extension Verid_Image: @unchecked Sendable {}
extension Verid_Image.ImageFormat: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "verid"

extension Verid_Image: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Image"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "data"),
    2: .same(proto: "width"),
    3: .same(proto: "height"),
    4: .standard(proto: "bytes_per_row"),
    5: .same(proto: "orientation"),
    6: .same(proto: "format"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.data) }()
      case 2: try { try decoder.decodeSingularInt32Field(value: &self.width) }()
      case 3: try { try decoder.decodeSingularInt32Field(value: &self.height) }()
      case 4: try { try decoder.decodeSingularInt32Field(value: &self.bytesPerRow) }()
      case 5: try { try decoder.decodeSingularInt32Field(value: &self.orientation) }()
      case 6: try { try decoder.decodeSingularEnumField(value: &self.format) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.data.isEmpty {
      try visitor.visitSingularBytesField(value: self.data, fieldNumber: 1)
    }
    if self.width != 0 {
      try visitor.visitSingularInt32Field(value: self.width, fieldNumber: 2)
    }
    if self.height != 0 {
      try visitor.visitSingularInt32Field(value: self.height, fieldNumber: 3)
    }
    if self.bytesPerRow != 0 {
      try visitor.visitSingularInt32Field(value: self.bytesPerRow, fieldNumber: 4)
    }
    if self.orientation != 0 {
      try visitor.visitSingularInt32Field(value: self.orientation, fieldNumber: 5)
    }
    if self.format != .grayscale {
      try visitor.visitSingularEnumField(value: self.format, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Verid_Image, rhs: Verid_Image) -> Bool {
    if lhs.data != rhs.data {return false}
    if lhs.width != rhs.width {return false}
    if lhs.height != rhs.height {return false}
    if lhs.bytesPerRow != rhs.bytesPerRow {return false}
    if lhs.orientation != rhs.orientation {return false}
    if lhs.format != rhs.format {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Verid_Image.ImageFormat: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "GRAYSCALE"),
    1: .same(proto: "RGB"),
    2: .same(proto: "BGR"),
    3: .same(proto: "RGBA"),
    4: .same(proto: "BGRA"),
    5: .same(proto: "ARGB"),
    6: .same(proto: "ABGR"),
  ]
}