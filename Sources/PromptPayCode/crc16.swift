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

/**
 export function crc16xmodem(data: string, crc = 0x0) {
   for (const i of data) {
     const b = i.charCodeAt(0)
     const n = (b ^ (crc >> 8)) & 0xff
     crc = TABLE[n] ^ (crc << 8)
   }
   return (crc ^ 0) & 0xffff
 }
 */

public extension Sequence where Element == UInt8
{
  var crc16: UInt16
  {
    self.reduce(UInt16(0xffff))
    {
      remainder, byte in
      let bigEndianInput = UInt16(byte) << 8
      let index = (bigEndianInput ^ remainder) >> 8
      return crc16Table[Int(index)] ^ (remainder << 8)
    }
  }
  
  func crc16(_ crc: UInt16 = 0) -> UInt16
  {
    self.reduce(crc)
    {
      remainder, byte in
      let bigEndianInput = UInt16(byte) << 8
      let index = (bigEndianInput ^ remainder) >> 8
      return crc16Table[Int(index)] ^ (remainder << 8)
    }
  }
}

public extension String
{
  var crc16: UInt16
  {
    Array(self.utf8).crc16
  }
}


