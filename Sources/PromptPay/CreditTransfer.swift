//
//  CreditTransfer.swift
//  PromptPayCode
//
//  Created by psksvp on 28/2/2025.
//

public struct CreditTransfer: Transaction
{
  let target: Proxy
  let amount: Double?
  
  public init(target: Proxy, amount: Double?)
  {
    self.target = target
    self.amount = amount
  }
}

public extension CreditTransfer
{
  var encoding: String
  {
    let targetSeq = [Tag(id: .payloadFormat, value: Tag.Value.merchantPresented),
                     Tag(code: target.code, value: target.value)]
    
    let payloadSeq = [Tag(id: .payloadFormat, value: Tag.Value.merchantPresentMode),
                      Tag(id: .poiMethod, value: self.amount != nil ? Tag.Value.poiDynamic : Tag.Value.poiStatic),
                      Tag(id: .creditTransfer, value: targetSeq.map{$0.encoding}.joined()),
                      Tag(id: .transactionCurrency, value: Tag.Value.currencyTHB),
                      Tag(id: .countryCode, value: "TH")] +
                      self.tag(amount: self.amount)
    
    

    let payload = payloadSeq.map{$0.encoding}.joined()
    let crc = self.crc(payload: payload).encoding
    return "\(payload)\(crc)"
  }
}
