//
//  Transaction.swift
//  PromptPayCode
//
//  Created by psksvp on 28/2/2025.
//

protocol Transaction
{
  var encoding: String {get}
}

extension Transaction
{
  func crc(payload: String) -> Tag
  {
    let checksum = String(format: "%04X", payload.crc16).uppercased()
    return Tag(id: .crc, value: checksum)
  }
  
  func tag(amount: Double?) -> [Tag]
  {
    guard let amt = amount else {return Array<Tag>()}
    return [Tag(id: .transactionAmount, value: "\(amt.round(precision: .hundredths))")]
  }
}


