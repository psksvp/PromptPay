//
//  Double+round.swift
//  PromptPayCode
//
//  Created by psksvp on 27/2/2025.
//  Adapted from https://www.advancedswift.com/rounding-floats-and-doubles-in-swift/

import Foundation

public extension Double
{
  enum RoundingPrecision
  {
    case ones
    case tenths
    case hundredths
  }
  
  func round(precision: RoundingPrecision = .tenths) -> Double
  {
    switch precision
    {
      case .ones:
        return round(self)
      case .tenths:
        return round(self * 10) / 10.0
      case .hundredths:
        return round(self * 100) / 100.0
    }
  }
}
