//
//  ProxyID.swift
//  PromptPayCode
//
//  Created by psksvp on 28/2/2025.
//

public enum Proxy
{
  case nationalID(String)
  case taxID(String)
  case phone(String)
  case ewallet(String)
  case bankAccount(String)

  // stupid code
  // each of this needs a method for validation.
  var value: String
  {
    switch self
    {
      case .phone(let n):
        // phone 13 didgit, 66 TH Ph Country code
        // TODO: Remove this hardcode!
        return String("0000000000000\(n.replacing(/^0/, with: "66"))".suffix(13))
      
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
