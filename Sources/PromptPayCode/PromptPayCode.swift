//
//  PromptPayCode.swift
//
//  Created by psksvp on 21/2/2025.

/**
 var ID_PAYLOAD_FORMAT = '00'
 var ID_POI_METHOD = '01'
 var ID_MERCHANT_INFORMATION_BOT = '29'
 var ID_TRANSACTION_CURRENCY = '53'
 var ID_TRANSACTION_AMOUNT = '54'
 var ID_COUNTRY_CODE = '58'
 var ID_CRC = '63'

 var PAYLOAD_FORMAT_EMV_QRCPS_MERCHANT_PRESENTED_MODE = '01'
 var POI_METHOD_STATIC = '11'
 var POI_METHOD_DYNAMIC = '12'
 var MERCHANT_INFORMATION_TEMPLATE_ID_GUID = '00'
 var BOT_ID_MERCHANT_PHONE_NUMBER = '01'
 var BOT_ID_MERCHANT_TAX_ID = '02'
 var BOT_ID_MERCHANT_EWALLET_ID = '03'
 var GUID_PROMPTPAY = 'A000000677010111'
 var TRANSACTION_CURRENCY_THB = '764'
 var COUNTRY_CODE_TH = 'TH'
 */

enum PromptPayID
{
  case phone(String)
  case tax(String)
  case ewallet(String)
  
  var code: String
  {
    switch self
    {
      case .phone(_): return "01"
      case .tax(_): return "02"
      case .ewallet(_): return "03"
    }
  }
}





