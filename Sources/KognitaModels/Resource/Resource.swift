//
//  Resource.swift
//  
//
//  Created by Mats Mollestad on 05/01/2021.
//

import Foundation

public protocol ResourceRepresentable {
    var id: Int { get }
    var title: String { get }
}

@dynamicMemberLookup
public enum Resource {

    public typealias ID = Int

    case book(BookResource)
    case video(VideoResource)
    case article(ArticleResource)
    
    enum Errors: Error {
        case unknownType
    }
}

extension Resource {
    
    public subscript<Value>(dynamicMember keyPath: KeyPath<ResourceRepresentable, Value>) -> Value {
        switch self {
        case .article(let article): return article[keyPath: keyPath]
        case .book(let book): return book[keyPath: keyPath]
        case .video(let video): return video[keyPath: keyPath]
        }
    }
}

extension Resource: Equatable {
    public static func == (lhs: Resource, rhs: Resource) -> Bool {
        switch (lhs, rhs) {
        case (.book(let left), .book(let right)):           return left == right
        case (.video(let left), .video(let right)):         return left == right
        case (.article(let left), .article(let right)):     return left == right
        default: return false
        }
    }
}

extension Resource: Codable {
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



extension Resource {
    public enum Import {

        public typealias ID = Int

        case book(BookResource.Import)
        case video(VideoResource.Import)
        case article(ArticleResource.Import)
        
        enum Errors: Error {
            case unknownType
        }
    }
}

extension Resource.Import: Equatable {
    public static func == (lhs: Resource.Import, rhs: Resource.Import) -> Bool {
        switch (lhs, rhs) {
        case (.book(let left), .book(let right)):           return left == right
        case (.video(let left), .video(let right)):         return left == right
        case (.article(let left), .article(let right)):     return left == right
        default: return false
        }
    }
}

extension Resource.Import: Codable {
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
