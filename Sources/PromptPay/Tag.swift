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
  
  public init(code: String, value: String, subTags:[Tag]? = nil)
  {
    self.id = code
    self.value = value
    self.subTags = subTags
  }
  public init(id: Tag.ID, value: String, subTags:[Tag]? = nil)
  {
    self.init(code: id.code, value: value, subTags: subTags)
  }
}

