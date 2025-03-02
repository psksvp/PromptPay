//
//  crc16.swift
//  PromptPayCode
//
//  Created by psksvp on 21/2/2025.
//

import Foundation
import CrcSwift


public extension Array where Element == UInt8
{
  var crc16: UInt16
  {
    CrcSwift.computeCrc16(self)
  }
}

public extension String
{
  var crc16: UInt16
  {
    Array(self.utf8).crc16
  }
}

public extension UInt16
{
  var hex: String
  {
    String(format: "%04X", self)
  }
}

