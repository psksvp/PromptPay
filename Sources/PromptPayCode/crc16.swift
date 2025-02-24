//
//  crc16.swift
//  PromptPayCode
//
//  Created by psksvp on 21/2/2025.
//

import Foundation


// CREDIT: The code is based on
// https://github.com/quickbirdeng/CRC-swift

public extension UInt8
{
  func crc16(polynomial: UInt16) -> UInt16
  {
    let byte = UInt16(self).bigEndian
    return (0..<8).reduce(byte)
           {
             result, _ in
             let isMostSignificantBitOne = result & 0x8000 != 0
             guard isMostSignificantBitOne else
             {
               return result << 1
             }
             return (result << 1) ^ polynomial
           }
  }
}

let crc16Table = (UInt8(0) ... UInt8(255)).map
                  {
                    byte in
                    byte.crc16(polynomial: 0x1021)
                  }

public extension Sequence where Element == UInt8
{
  var crc16: UInt16
  {
    self.reduce(UInt16(0))
    {
      remainder, byte in
      let bigEndianInput = UInt16(byte) << 8
      let index = (bigEndianInput ^ remainder) >> 8
      return crc16Table[Int(index)] ^ (remainder << 8)
    }
  }
}


