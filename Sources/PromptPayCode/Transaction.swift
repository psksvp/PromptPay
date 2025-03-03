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
    //63 is crc tag id, 04 is the len in char of checksum length.
    let crcTagString = "6304"
    let checksum = "\(payload)\(crcTagString)".crc16.hex.uppercased()
    return Tag(id: .crc, value: checksum)
  }
  
  func tag(amount: Double?) -> [Tag]
  {
    guard let amt = amount else {return Array<Tag>()}
    let fAMT = String(format: "%.2f", amt.round(precision: .hundredths))
    return [Tag(id: .transactionAmount, value: "\(fAMT)")]
  }
}


