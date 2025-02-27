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
  
  func round(precision: RoundingPrecision = .hundredths) -> Double
  {
    switch precision
    {
      case .ones:
        return Darwin.round(self)
      case .tenths:
        return Darwin.round(self * 10) / 10.0
      case .hundredths:
        return Darwin.round(self * 100) / 100.0
    }
  }
}
