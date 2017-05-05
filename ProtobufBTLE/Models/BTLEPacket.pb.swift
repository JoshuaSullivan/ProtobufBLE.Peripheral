/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: BTLEPacket.proto
 *
 */

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _1: SwiftProtobuf.ProtobufAPIVersion_1 {}
  typealias Version = _1
}

struct ProtoBufBTLE_Packet: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".Packet"

  var time: Double = 0

  var rx: Float = 0

  var ry: Float = 0

  var rz: Float = 0

  var text: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularDoubleField(value: &self.time)
      case 2: try decoder.decodeSingularFloatField(value: &self.rx)
      case 3: try decoder.decodeSingularFloatField(value: &self.ry)
      case 4: try decoder.decodeSingularFloatField(value: &self.rz)
      case 5: try decoder.decodeSingularStringField(value: &self.text)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.time != 0 {
      try visitor.visitSingularDoubleField(value: self.time, fieldNumber: 1)
    }
    if self.rx != 0 {
      try visitor.visitSingularFloatField(value: self.rx, fieldNumber: 2)
    }
    if self.ry != 0 {
      try visitor.visitSingularFloatField(value: self.ry, fieldNumber: 3)
    }
    if self.rz != 0 {
      try visitor.visitSingularFloatField(value: self.rz, fieldNumber: 4)
    }
    if !self.text.isEmpty {
      try visitor.visitSingularStringField(value: self.text, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "ProtoBufBTLE"

extension ProtoBufBTLE_Packet: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "time"),
    2: .same(proto: "rx"),
    3: .same(proto: "ry"),
    4: .same(proto: "rz"),
    5: .same(proto: "text"),
  ]

  func _protobuf_generated_isEqualTo(other: ProtoBufBTLE_Packet) -> Bool {
    if self.time != other.time {return false}
    if self.rx != other.rx {return false}
    if self.ry != other.ry {return false}
    if self.rz != other.rz {return false}
    if self.text != other.text {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
