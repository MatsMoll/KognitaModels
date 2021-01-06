//
//  Resource.swift
//  
//
//  Created by Mats Mollestad on 05/01/2021.
//

import Foundation

public enum Resource: Equatable, Codable {
    public static func == (lhs: Resource, rhs: Resource) -> Bool {
        switch (lhs, rhs) {
        case (.book(let left), .book(let right)):      return left == right
        case (.video(let left), .video(let right)):     return left == right
        case (.article(let left), .article(let right)):   return left == right
        default: return false
        }
    }

    public typealias ID = Int

    case book(BookResource)
    case video(VideoResource)
    case article(ArticleResource)
    
    enum Errors: Error {
        case unknownType
    }
    
    enum CodingKeys: String, CodingKey {
        case type
    }
    
    public init(from decoder: Decoder) throws {
        let keys = try decoder.container(keyedBy: CodingKeys.self)
        let type = try keys.decode(String.self, forKey: .type)
        switch type {
        case "article": self = try .article(.init(from: decoder))
        case "book": self = try .book(.init(from: decoder))
        case "video": self = try .video(.init(from: decoder))
        default: throw Errors.unknownType
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .article(let resource):
            try container.encode("article", forKey: .type)
            try resource.encode(to: encoder)
        case .book(let resource):
            try container.encode("book", forKey: .type)
            try resource.encode(to: encoder)
        case .video(let resource):
            try container.encode("video", forKey: .type)
            try resource.encode(to: encoder)
        }
    }
}
