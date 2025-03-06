//
//  Tag+encoding.swift
//  PromptPayCode
//
//  Created by psksvp on 5/3/2025.
//

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
                                       .joined() ?? ""
    return "\(self.id)\(len)\(subTagsEncoding)\(self.value)"
  }
}
