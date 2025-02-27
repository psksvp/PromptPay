//
//  TransactionUserID.swift
//  PromptPayCode
//
//  Created by psksvp on 25/2/2025.
//
import Foundation

public protocol TransactionUserID
{
  var value: String { get }
}

public class NumericID: TransactionUserID
{
  let id: String
  
  public init?(id: String, validLength: Int)
  {
    guard id.count == validLength,
          id.allSatisfy({$0.isNumber}) else {return nil}
        
    self.id = id
  }
  
  public var value: String
  {
    return self.id
  }
}

public class NationalID: NumericID
{
  public init?(id: String)
  {
    super.init(id: id, validLength: 13)
  }
}

//public class PhoneNumber: TransactionUserID
//{
//  
//}
