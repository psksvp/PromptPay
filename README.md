# PromptPay code generator in Swift

The Swift code is based on https://github.com/maythiwat/promptparse.

## Examples

```swift 

let code = BillPayment(billerID: "0112233445566",
                       amount: nil,
                       ref1: "CUSTOMER001",
                       ref2: "INV001",
                       ref3: "SCB").encoding

```


```swift 

let code = CreditTransfer(target: .phone("0812223333"), 
                          amount: nil).encoding

```

```swift 

let code = CreditTransfer(target: .phone("0812223333"), 
                          amount: 31.25).encoding

```

The return value of from `Transaction.encoding` is a `String` containing the encoding. To generate QR-code, pass the encoding string to any QR code generator. I use this one https://github.com/dagronf/QRCode

## Swift PM

```swift
dependencies: [.package(url: "https://github.com/psksvp/PromptPay.git", 
                        branch: "main")]
```

## Caution

The code has not been extensively tested. I tested it just enough for what I need. 

## License

MIT License

Copyright 2025 by psksvp gmail dot com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


psksvp
