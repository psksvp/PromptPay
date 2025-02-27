//
//  CreditTransfer.swift
//  PromptPayCode
//
//  Created by psksvp on 28/2/2025.
//

public struct CreditTransfer
{
  let target: TransactionUserID
  let amount: Double?
  
  public init(target: TransactionUserID, amount: Double?)
  {
    self.target = target
    self.amount = amount
  }
}

public extension CreditTransfer
{
  var encoding: String
  {
    let amountSeq =
    {
      guard let amt = self.amount else {return Array<Tag>()}
      return [Tag(id: .transactionAmount, value: "\(amt.round(precision: .hundredths))")]
    }
    
    let targetSeq = [Tag(id: .payloadFormat, value: Tag.Value.merchantPresented),
                     Tag(code: target.code, value: target.value)]
    
    let payloadSeq = [Tag(id: .payloadFormat, value: Tag.Value.merchantPresentMode),
                      Tag(id: .poiMethod, value: self.amount != nil ? Tag.Value.poiDynamic : Tag.Value.poiStatic),
                      Tag(id: .creditTransfer, value: targetSeq.map{$0.encoding}.joined()),
                      Tag(id: .transactionCurrency, value: Tag.Value.currencyTHB),
                      Tag(id: .countryCode, value: "TH")] + amountSeq()
    
    let crc =
    {
      let crcTagID = "00\(Tag.ID.crc.code)".suffix(2)
      let checksum = String(format: "%04X", payloadSeq.map{$0.encoding}.joined().crc16).uppercased()
      return "\(crcTagID)04\(checksum)"
    }
    
    return ""
  }
}
