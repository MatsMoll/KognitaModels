//
//  ArticleResource.swift
//  
//
//  Created by Mats Mollestad on 05/01/2021.
//

import Foundation

public struct ArticleResource: Equatable, Codable {
    public init(title: String, url: String, author: String) {
        self.title = title
        self.url = url
        self.author = author
    }
    
    public let title: String
    public let url: String
    public let author: String
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
