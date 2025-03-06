//
//  Transaction+tag.swift
//  PromptPay
//
//  Created by psksvp on 6/3/2025.
//

public extension Transaction
{
  func crc(payload: String) -> Tag
  {
    //63 is crc tag id, 04 is the len in char of checksum length.
    //have to do it this way becase the tag ig and len of cksum
    //need to be in for computing cksum
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
