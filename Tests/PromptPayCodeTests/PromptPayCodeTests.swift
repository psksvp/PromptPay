import Testing
@testable import PromptPayCode

@Test
func crc16StringTest() async throws
{
  let crc = "00020101021129370016A0000006770101110113006681222333353037645802TH6304".crc16
  #expect(String(format: "%04X", crc).uppercased() == "1DCF")
}


//@Test
//func testBillPayment() async throws
//{
//  print(BillPayment(billerID: .nationalID("12322"), amount: 23.34).encoding)
//}

@Test
func testCreditTransferNoAmount() async throws
{
  let generated = CreditTransfer(target: .phone("0812223333"), amount: nil).encoding
  let expected = "00020101021129370016A0000006770101110113006681222333353037645802TH63041DCF"
  //print(generated)
  //print(expected)
  #expect(generated == expected)
}

@Test
func testCreditTransferWithAmount() async throws
{
  let expected = "00020101021229370016A0000006770101110113006681222333353037645802TH540530.0063043CAD"
  let generated = CreditTransfer(target: .phone("0812223333"), amount: 30).encoding
//  print(generated)
//  print(expected)
  #expect(generated == expected)
}
