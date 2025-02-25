//
//  PromptPayCode.swift
//
//  Created by psksvp on 21/2/2025.
//
//  PromptPay Doc
//  https://www.bot.or.th/content/dam/bot/fipcs/documents/FPG/2562/ThaiPDF/25620084.pdf


enum AID: String
{
  case merchantPresented   = "A000000677010111"
  case customerPresented   = "A000000677010114"
  case domesticMechant     = "A000000677010112"
  case crossBorderMerchant = "A000000677012006"
  case paymentInnovation   = "A000000677012004"
}

enum IDType
{
  case nationOrTaxID(String)
  case phone(String)
  case ewallet(String)
  case bankAccount(String)
  
  var code: String
  {
    switch self
    {
      case .phone(_): 
        return "01"
      case .nationOrTaxID(_): 
        return "02"
      case .ewallet(_): 
        return "03"
      case .bankAccount(_): 
        return "04"
    }
  }
}

enum TransactionType: String
{
  case creditTransfer = "29"
  case billPayment = "30"
  case paymentInnovation = "31"
}







enum TagID: String
{
  case payloadFormat = "00"   // EMVCo QR Code Specification for Payment Systems : Merchant-Presented Mode
  case pointOfInitiate = "01" // Merchant-Presented, eg, merchart put code for customer to scan
  
}











