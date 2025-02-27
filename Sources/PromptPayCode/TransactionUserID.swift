//
//  TransactionUserID.swift
//  PromptPayCode
//
//  Created by psksvp on 25/2/2025.
//
import Foundation

//public class TransactionProxy
//{
//  public let code: String
//  public let value: String
//  
//  public init(code: String, value: String)
//  {
//    self.code = code
//    self.value = value
//  }
//  
//  public func validate() -> Bool
//  {
//    {fatalError("TransactionProxy.code implement me")}
//  }
//}
//
//public class NationalID: TransactionProxy
//{
//  override public func validate() -> Bool
//  {
//    true
//  }
//}
//
//public class TaxID: TransactionProxy
//{
//  override public func validate() -> Bool
//  {
//    true
//  }
//}
//
//public class Phone: TransactionProxy
//{
//  override public func validate() -> Bool
//  {
//    true
//  }
//}
//
//public class EWallet: TransactionProxy
//{
//  override public func validate() -> Bool
//  {
//    true
//  }
//}
//
//public class BankAccount: TransactionProxy
//{
//  override public func validate() -> Bool
//  {
//    true
//  }
//}

public enum TransactionUserID
{
  case nationalID(String)
  case taxID(String)
  case phone(String)
  case ewallet(String)
  case bankAccount(String)

  // stupid code
  // each of this needs a methor for validation.
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
  
  var code: String
  {
    switch self
    {
      case .phone(_):
        return "01"
      case .nationalID(_):
        return "02"
      case .taxID(_):
        return "02"
      case .ewallet(_):
        return "03"
      case .bankAccount(_):
        return "04"
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
