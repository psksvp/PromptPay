//
//  BillPayment.swift
//  PromptPayCode
//
//  Created by psksvp on 25/2/2025.
//

public struct BillPayment
{
  public let billerID: IDType
  public let amount: Double?
  public let ref1: String?
  public let ref2: String?
  public let ref3: String?
}

public extension BillPayment
{
  var aid: AID
  {
    
  }
  
  var encoding: String
  {
    ""
  }
}


