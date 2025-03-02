import Testing
@testable import PromptPayCode

@Test
func crc16StringTest() async throws
{
  let crc = "00020101021129370016A0000006770101110113006681222333353037645802TH6304".crc16.hex
  #expect(crc.uppercased() == "1DCF")
  #expect("hello".crc16.hex.uppercased() == "D26E")
  #expect("hello1234".crc16.hex.uppercased() == "1288")
  #expect("dog".crc16.hex.uppercased() == "8C62")
  #expect("cat".crc16.hex.uppercased() == "08AF")
  #expect("abcdefghijklmnopqrstuvwxyz0123456789".crc16.hex.uppercased() == "4AEB")
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
