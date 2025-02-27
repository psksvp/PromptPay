//
//  BillPayment.swift
//  PromptPayCode
//
//  Created by psksvp on 25/2/2025.
//

public struct BillPayment
{
  public enum Mechant
  {
    case domestic
    case crossborder
  }
  public let billerID: TransactionUserID
  public let aid: String
  public let amount: Double?
  public let ref1: String?
  public let ref2: String?
  public let ref3: String?
  
  public init(billerID: TransactionUserID,
              amount: Double?,
              merchant: Mechant = .domestic,
              ref1: String? = nil,
              ref2: String? = nil,
              ref3: String? = nil)
  {
    self.billerID = billerID
    self.amount = amount
    self.aid = merchant == .domestic ? Tag.Value.domesticMechant : Tag.Value.crossBorderMerchant
    self.ref1 = ref1
    self.ref2 = ref2
    self.ref3 = ref3
  }
}

public extension BillPayment
{  
  var encoding: String
  {
    let ref2Seq =
    {
      guard let ref = self.ref2 else {return Array<Tag>()}
      return [Tag(id: .ref2, value: ref)]
    }
    
    let paymentSeq = [Tag(id: .aid, value: self.aid),
                      Tag(id: .billerID, value: billerID.value),
                      Tag(id: .ref1, value: self.ref1 ?? "")] + ref2Seq()
      
    let amountSeq =
    {
      guard let amt = self.amount else {return Array<Tag>()}
      return [Tag(id: .transactionAmount, value: "\(amt.round(precision: .hundredths))")]
    }
    
    let ref3Seq =
    {
      guard let ref = self.ref3 else {return Array<Tag>()}
      return [Tag(id: .additionalData, value: Tag(id: .ref3, value: ref).encoding)]
    }

    let payloadSeq = [Tag(id: .payloadFormat, value: Tag.Value.merchantPresentMode),
                      Tag(id: .poiMethod, value: self.amount != nil ? Tag.Value.poiDynamic : Tag.Value.poiStatic),
                      Tag(id: .payment, value: paymentSeq.map{$0.encoding}.joined()),
                      Tag(id: .transactionCurrency, value: Tag.Value.currencyTHB),
                      Tag(id: .countryCode, value: "TH")] + amountSeq() + ref3Seq()
    
    let crc =
    {
      let crcTagID = "00\(Tag.ID.crc.code)".suffix(2)
      let checksum = String(format: "%04X", payloadSeq.map{$0.encoding}.joined().crc16).uppercased()
      return "\(crcTagID)04\(checksum)"
    }

    
    return "\(payloadSeq.map{$0.encoding}.joined())\(crc())"
  }
}


