//
//  Tag+ID+Value.swift
//  PromptPayCode
//
//  Created by psksvp on 5/3/2025.
//

public extension Tag
{
  struct Value
  {
    static let merchantPresentMode = "01"
    static let poiDynamic = "12"
    static let poiStatic = "11"
    static let domesticMechant = "A000000677010112"
    static let crossBorderMerchant = "A000000677012006"
    static let merchantPresented = "A000000677010111"
    static let customerPresented = "A000000677010114"
    static let currencyTHB = "764"
  }
  
  enum ID
  {
    case payloadFormat
    case billerID
    case payment
    case creditTransfer
    case paymentInnovation
    case ref1
    case ref2
    case ref3
    case aid
    case poiMethod
    case transactionCurrency
    case transactionAmount
    case countryCode
    case postalCode
    case additionalData
    case crc
    
    var code: String
    {
      let lookup: [ID : String] = [.payloadFormat : "00",
                                   .billerID : "01",
                                   .payment : "30",
                                   .creditTransfer : "29",
                                   .paymentInnovation : "31",
                                   .ref1 : "02",
                                   .ref2 : "03",
                                   .ref3 : "07",
                                   .aid : "00",
                                   .poiMethod : "01",
                                   .transactionCurrency : "53",
                                   .transactionAmount : "54",
                                   .countryCode : "58",
                                   .postalCode : "61",
                                   .additionalData : "62",
                                   .crc : "63"]
      
      return lookup[self]!
    }
  }
}
