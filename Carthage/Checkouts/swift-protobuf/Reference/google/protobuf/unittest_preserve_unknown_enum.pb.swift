/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: google/protobuf/unittest_preserve_unknown_enum.proto
 *
 */

// Protocol Buffers - Google's data interchange format
// Copyright 2008 Google Inc.  All rights reserved.
// https://developers.google.com/protocol-buffers/
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//     * Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
// copyright notice, this list of conditions and the following disclaimer
// in the documentation and/or other materials provided with the
// distribution.
//     * Neither the name of Google Inc. nor the names of its
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

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

enum Proto3PreserveUnknownEnumUnittest_MyEnum: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case foo // = 0
  case bar // = 1
  case baz // = 2
  case UNRECOGNIZED(Int)

  init() {
    self = .foo
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .foo
    case 1: self = .bar
    case 2: self = .baz
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .foo: return 0
    case .bar: return 1
    case .baz: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

enum Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case eFoo // = 0
  case eBar // = 1
  case eBaz // = 2
  case eExtra // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .eFoo
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .eFoo
    case 1: self = .eBar
    case 2: self = .eBaz
    case 3: self = .eExtra
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .eFoo: return 0
    case .eBar: return 1
    case .eBaz: return 2
    case .eExtra: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

struct Proto3PreserveUnknownEnumUnittest_MyMessage: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".MyMessage"

  var e: Proto3PreserveUnknownEnumUnittest_MyEnum = Proto3PreserveUnknownEnumUnittest_MyEnum.foo

  var repeatedE: [Proto3PreserveUnknownEnumUnittest_MyEnum] = []

  var repeatedPackedE: [Proto3PreserveUnknownEnumUnittest_MyEnum] = []

  /// not packed
  var repeatedPackedUnexpectedE: [Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra] = []

  var o: Proto3PreserveUnknownEnumUnittest_MyMessage.OneOf_O? = nil

  var oneofE1: Proto3PreserveUnknownEnumUnittest_MyEnum {
    get {
      if case .oneofE1(let v)? = o {return v}
      return Proto3PreserveUnknownEnumUnittest_MyEnum.foo
    }
    set {o = .oneofE1(newValue)}
  }

  var oneofE2: Proto3PreserveUnknownEnumUnittest_MyEnum {
    get {
      if case .oneofE2(let v)? = o {return v}
      return Proto3PreserveUnknownEnumUnittest_MyEnum.foo
    }
    set {o = .oneofE2(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_O: Equatable {
    case oneofE1(Proto3PreserveUnknownEnumUnittest_MyEnum)
    case oneofE2(Proto3PreserveUnknownEnumUnittest_MyEnum)

    static func ==(lhs: Proto3PreserveUnknownEnumUnittest_MyMessage.OneOf_O, rhs: Proto3PreserveUnknownEnumUnittest_MyMessage.OneOf_O) -> Bool {
      switch (lhs, rhs) {
      case (.oneofE1(let l), .oneofE1(let r)): return l == r
      case (.oneofE2(let l), .oneofE2(let r)): return l == r
      default: return false
      }
    }
  }

  init() {}

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.e)
      case 2: try decoder.decodeRepeatedEnumField(value: &self.repeatedE)
      case 3: try decoder.decodeRepeatedEnumField(value: &self.repeatedPackedE)
      case 4: try decoder.decodeRepeatedEnumField(value: &self.repeatedPackedUnexpectedE)
      case 5, 6:
        if self.o != nil {
          try decoder.handleConflictingOneOf()
        }
        self.o = try Proto3PreserveUnknownEnumUnittest_MyMessage.OneOf_O(byDecodingFrom: &decoder, fieldNumber: fieldNumber)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.e != Proto3PreserveUnknownEnumUnittest_MyEnum.foo {
      try visitor.visitSingularEnumField(value: self.e, fieldNumber: 1)
    }
    if !self.repeatedE.isEmpty {
      try visitor.visitPackedEnumField(value: self.repeatedE, fieldNumber: 2)
    }
    if !self.repeatedPackedE.isEmpty {
      try visitor.visitPackedEnumField(value: self.repeatedPackedE, fieldNumber: 3)
    }
    if !self.repeatedPackedUnexpectedE.isEmpty {
      try visitor.visitPackedEnumField(value: self.repeatedPackedUnexpectedE, fieldNumber: 4)
    }
    try self.o?.traverse(visitor: &visitor)
    try unknownFields.traverse(visitor: &visitor)
  }
}

struct Proto3PreserveUnknownEnumUnittest_MyMessagePlusExtra: SwiftProtobuf.Message {
  static let protoMessageName: String = _protobuf_package + ".MyMessagePlusExtra"

  var e: Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra = Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra.eFoo

  var repeatedE: [Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra] = []

  var repeatedPackedE: [Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra] = []

  var repeatedPackedUnexpectedE: [Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra] = []

  var o: Proto3PreserveUnknownEnumUnittest_MyMessagePlusExtra.OneOf_O? = nil

  var oneofE1: Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra {
    get {
      if case .oneofE1(let v)? = o {return v}
      return Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra.eFoo
    }
    set {o = .oneofE1(newValue)}
  }

  var oneofE2: Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra {
    get {
      if case .oneofE2(let v)? = o {return v}
      return Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra.eFoo
    }
    set {o = .oneofE2(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_O: Equatable {
    case oneofE1(Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra)
    case oneofE2(Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra)

    static func ==(lhs: Proto3PreserveUnknownEnumUnittest_MyMessagePlusExtra.OneOf_O, rhs: Proto3PreserveUnknownEnumUnittest_MyMessagePlusExtra.OneOf_O) -> Bool {
      switch (lhs, rhs) {
      case (.oneofE1(let l), .oneofE1(let r)): return l == r
      case (.oneofE2(let l), .oneofE2(let r)): return l == r
      default: return false
      }
    }
  }

  init() {}

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.e)
      case 2: try decoder.decodeRepeatedEnumField(value: &self.repeatedE)
      case 3: try decoder.decodeRepeatedEnumField(value: &self.repeatedPackedE)
      case 4: try decoder.decodeRepeatedEnumField(value: &self.repeatedPackedUnexpectedE)
      case 5, 6:
        if self.o != nil {
          try decoder.handleConflictingOneOf()
        }
        self.o = try Proto3PreserveUnknownEnumUnittest_MyMessagePlusExtra.OneOf_O(byDecodingFrom: &decoder, fieldNumber: fieldNumber)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.e != Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra.eFoo {
      try visitor.visitSingularEnumField(value: self.e, fieldNumber: 1)
    }
    if !self.repeatedE.isEmpty {
      try visitor.visitPackedEnumField(value: self.repeatedE, fieldNumber: 2)
    }
    if !self.repeatedPackedE.isEmpty {
      try visitor.visitPackedEnumField(value: self.repeatedPackedE, fieldNumber: 3)
    }
    if !self.repeatedPackedUnexpectedE.isEmpty {
      try visitor.visitPackedEnumField(value: self.repeatedPackedUnexpectedE, fieldNumber: 4)
    }
    try self.o?.traverse(visitor: &visitor)
    try unknownFields.traverse(visitor: &visitor)
  }
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "proto3_preserve_unknown_enum_unittest"

extension Proto3PreserveUnknownEnumUnittest_MyEnum: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "FOO"),
    1: .same(proto: "BAR"),
    2: .same(proto: "BAZ"),
  ]
}

extension Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "E_FOO"),
    1: .same(proto: "E_BAR"),
    2: .same(proto: "E_BAZ"),
    3: .same(proto: "E_EXTRA"),
  ]
}

extension Proto3PreserveUnknownEnumUnittest_MyMessage: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "e"),
    2: .standard(proto: "repeated_e"),
    3: .standard(proto: "repeated_packed_e"),
    4: .standard(proto: "repeated_packed_unexpected_e"),
    5: .standard(proto: "oneof_e_1"),
    6: .standard(proto: "oneof_e_2"),
  ]

  func _protobuf_generated_isEqualTo(other: Proto3PreserveUnknownEnumUnittest_MyMessage) -> Bool {
    if self.e != other.e {return false}
    if self.repeatedE != other.repeatedE {return false}
    if self.repeatedPackedE != other.repeatedPackedE {return false}
    if self.repeatedPackedUnexpectedE != other.repeatedPackedUnexpectedE {return false}
    if self.o != other.o {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Proto3PreserveUnknownEnumUnittest_MyMessage.OneOf_O {
  fileprivate init?<T: SwiftProtobuf.Decoder>(byDecodingFrom decoder: inout T, fieldNumber: Int) throws {
    switch fieldNumber {
    case 5:
      var value = Proto3PreserveUnknownEnumUnittest_MyEnum()
      try decoder.decodeSingularEnumField(value: &value)
      self = .oneofE1(value)
      return
    case 6:
      var value = Proto3PreserveUnknownEnumUnittest_MyEnum()
      try decoder.decodeSingularEnumField(value: &value)
      self = .oneofE2(value)
      return
    default:
      break
    }
    return nil
  }

  fileprivate func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    switch self {
    case .oneofE1(let v):
      try visitor.visitSingularEnumField(value: v, fieldNumber: 5)
    case .oneofE2(let v):
      try visitor.visitSingularEnumField(value: v, fieldNumber: 6)
    }
  }
}

extension Proto3PreserveUnknownEnumUnittest_MyMessagePlusExtra: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "e"),
    2: .standard(proto: "repeated_e"),
    3: .standard(proto: "repeated_packed_e"),
    4: .standard(proto: "repeated_packed_unexpected_e"),
    5: .standard(proto: "oneof_e_1"),
    6: .standard(proto: "oneof_e_2"),
  ]

  func _protobuf_generated_isEqualTo(other: Proto3PreserveUnknownEnumUnittest_MyMessagePlusExtra) -> Bool {
    if self.e != other.e {return false}
    if self.repeatedE != other.repeatedE {return false}
    if self.repeatedPackedE != other.repeatedPackedE {return false}
    if self.repeatedPackedUnexpectedE != other.repeatedPackedUnexpectedE {return false}
    if self.o != other.o {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Proto3PreserveUnknownEnumUnittest_MyMessagePlusExtra.OneOf_O {
  fileprivate init?<T: SwiftProtobuf.Decoder>(byDecodingFrom decoder: inout T, fieldNumber: Int) throws {
    switch fieldNumber {
    case 5:
      var value = Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra()
      try decoder.decodeSingularEnumField(value: &value)
      self = .oneofE1(value)
      return
    case 6:
      var value = Proto3PreserveUnknownEnumUnittest_MyEnumPlusExtra()
      try decoder.decodeSingularEnumField(value: &value)
      self = .oneofE2(value)
      return
    default:
      break
    }
    return nil
  }

  fileprivate func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    switch self {
    case .oneofE1(let v):
      try visitor.visitSingularEnumField(value: v, fieldNumber: 5)
    case .oneofE2(let v):
      try visitor.visitSingularEnumField(value: v, fieldNumber: 6)
    }
  }
}
