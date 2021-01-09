//
//  ArticleResource.swift
//  
//
//  Created by Mats Mollestad on 05/01/2021.
//

import Foundation

public struct ArticleResource: Equatable, Codable, ResourceRepresentable {
    public init(id: Int, title: String, url: String, author: String) {
        self.id = id
        self.title = title
        self.url = url
        self.author = author
    }
    
    public var id: Int
    public let title: String
    public let url: String
    public let author: String
    
    public var createContent: ArticleResource.Create.Data {
        ArticleResource.Create.Data(
            title: title,
            url: url,
            author: author
        )
    }
}

extension ArticleResource {
    public enum Create {
        public struct Data: Codable {
            public init(title: String, url: String, author: String) {
                self.title = title
                self.url = url
                self.author = author
            }
            
            public let title: String
            public let url: String
            public let author: String
        }
    }
}

extension ArticleResource {
    
    public struct Import: Equatable, Codable {
        public init(title: String, url: String, author: String) {
            self.title = title
            self.url = url
            self.author = author
        }
        
        public let title: String
        public let url: String
        public let author: String
        
        public var createContent: ArticleResource.Create.Data {
            ArticleResource.Create.Data(
                title: title,
                url: url,
                author: author
            )
        }
    }

}
