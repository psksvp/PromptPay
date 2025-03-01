import Testing
@testable import PromptPayCode

@Test
func crc16BytesArrayTest() async throws
{
  let a: Array<UInt8> = [1, 2, 240, 125, 3]
  let b: Array<UInt8> = [1, 2]
  #expect(a.crc16 == 59917)
  #expect(b.crc16 == 4979)
}

@Test
func crc16StringTest() async throws
{
  let crc = "hello".crc16
  print(String(format: "%04X", crc))
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
  print(generated)
  let expected = "00020101021129370016A0000006770101110113006681222333353037645802TH63041DCF"
  print(expected)
  #expect(generated == expected)
}

@Test
func testCreditTransferWithAmount() async throws
{
  let expected = "00020101021229370016A0000006770101110113006681222333353037645802TH540530.0063043CAD"
  let generated = CreditTransfer(target: .phone("0812223333"), amount: 30).encoding
  print(generated)
  print(expected)
  #expect(generated == expected)
}
