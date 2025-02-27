//
//  Tags.swift
//  PromptPayCode
//
//  Created by psksvp on 25/2/2025.
//

public struct Tag
{
  public let id: Tag.ID
  public let value: String
  public let subTags: [Tag]?
  
  public init(id: Tag.ID, value: String, subTags:[Tag]? = nil)
  {
    self.id = id
    self.value = value
    self.subTags = subTags
  }
}

public extension Tag
{
  struct Value
  {
    static let merchantPresentMode = "01"
    static let poiDynamic = "12"
    static let poiStatic = "11"
    static let domesticMechant = "A000000677010112"
    static let crossBorderMerchant = "A000000677012006"
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
                                   .countryCode : "58"]
      
      return lookup[self]!
    }
  }
}

public extension Tag
{
  var length: Int
  {
    self.value.count
  }
  
  var encoding: String
  {
    // length of len is 2 numeric char, according to spec, max value is 99
    // pad prefix with 0s
    // if self.length == 0 then len = "00"
    // if self.length == 1 then len = "01
    // if self.length == 12 then len = "12"
    let len = "00\(self.length)".suffix(2)
    // encode subtags if there is
    let subTagsEncoding = self.subTags?.map{$0.encoding}
                                       .joined(separator: "") ?? ""
    return "\(self.id.code)\(len)\(subTagsEncoding)\(self.value)"
  }
}
