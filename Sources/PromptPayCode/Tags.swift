//
//  Tags.swift
//  PromptPayCode
//
//  Created by psksvp on 25/2/2025.
//

public struct Tag
{
  public let id: String
  public let value: String
  public let subTags: [Tag]?
  
  public init(id: String, value: String, subTags:[Tag]? = nil)
  {
    self.id = id
    self.value = value
    self.subTags = subTags
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
    // length of len is 2 char, according to spec, max value is 99
    // pad prefix with 0s
    // if self.length == 0 then len = "00"
    // if self.length == 1 then len = "01
    // if self.length == 12 then len = "12"
    let len = "00\(self.length)".suffix(2)
    // encode subtags if there is
    let subTagsEncoding = self.subTags?.map{$0.encoding}.joined(separator: "") ?? ""
    return "\(len)\(subTagsEncoding)\(self.value)"
  }
}
