// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: rect.proto
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

struct Verid_Rect {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var origin: Verid_Point {
    get {return _origin ?? Verid_Point()}
    set {_origin = newValue}
  }
  /// Returns true if `origin` has been explicitly set.
  var hasOrigin: Bool {return self._origin != nil}
  /// Clears the value of `origin`. Subsequent reads from it will return its default value.
  mutating func clearOrigin() {self._origin = nil}

  var size: Verid_Size {
    get {return _size ?? Verid_Size()}
    set {_size = newValue}
  }
  /// Returns true if `size` has been explicitly set.
  var hasSize: Bool {return self._size != nil}
  /// Clears the value of `size`. Subsequent reads from it will return its default value.
  mutating func clearSize() {self._size = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _origin: Verid_Point? = nil
  fileprivate var _size: Verid_Size? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Verid_Rect: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "verid"

extension Verid_Rect: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Rect"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "origin"),
    2: .same(proto: "size"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._origin) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._size) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._origin {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._size {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Verid_Rect, rhs: Verid_Rect) -> Bool {
    if lhs._origin != rhs._origin {return false}
    if lhs._size != rhs._size {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}