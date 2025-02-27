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
    let paymentSeq = [Tag(id: .aid, value: self.aid),
                      Tag(id: .billerID, value: billerID.value),
                      Tag(id: .ref1, value: self.ref1 ?? "")] + (ref2 != nil ? [Tag(id: .ref2, value: ref2!)] : [])
                      

    let payloadSeq = [Tag(id: .payloadFormat, value: Tag.Value.merchantPresentMode),
                      Tag(id: .poiMethod, value: self.amount != nil ? Tag.Value.poiDynamic : Tag.Value.poiStatic),
                      Tag(id: .payment, value: paymentSeq.map{$0.encoding}.joined()),
                      Tag(id: .transactionCurrency, value: Tag.Value.currencyTHB),
                      Tag(id: .countryCode, value: "TH")]

    
    return payloadSeq.map{$0.encoding}.joined()
  }
}


