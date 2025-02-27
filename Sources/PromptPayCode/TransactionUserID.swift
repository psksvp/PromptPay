//
//  TransactionUserID.swift
//  PromptPayCode
//
//  Created by psksvp on 25/2/2025.
//
import Foundation

public enum TransactionUserID
{
  case nationalID(String)
  case taxID(String)
  case phone(String)
  case ewallet(String)
  case bankAccount(String)

  var value: String
  {
    switch self
    {
      case .phone(let n):
        return n
      case .nationalID(let n):
        return n
      case .taxID(let n):
        return n
      case .ewallet(let n):
        return n
      case .bankAccount(let n):
        return n
    }
  }
}

//public protocol TransactionUserID
//{
//  var value: String { get }
//}
//
//public class NumericID: TransactionUserID
//{
//  let id: String
//  
//  public init?(id: String, validLength: Int)
//  {
//    guard id.count == validLength,
//          id.allSatisfy({$0.isNumber}) else {return nil}
//        
//    self.id = id
//  }
//  
//  public var value: String
//  {
//    return self.id
//  }
//}
//
//public class NationalID: NumericID
//{
//  public init?(id: String)
//  {
//    super.init(id: id, validLength: 13)
//  }
//}

//public class PhoneNumber: TransactionUserID
//{
//  
//}
