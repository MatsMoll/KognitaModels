//
//  BookResource.swift
//  
//
//  Created by Mats Mollestad on 05/01/2021.
//

import Foundation

public struct BookResource: Equatable, Codable {
    public init(title: String, bookTitle: String, startPageNumber: Int, endPageNumber: Int, author: String) {
        self.title = title
        self.bookTitle = bookTitle
        self.startPageNumber = startPageNumber
        self.endPageNumber = endPageNumber
        self.author = author
    }
    
    public let title: String
    public let bookTitle: String
    public let startPageNumber: Int
    public let endPageNumber: Int
    public let author: String
}

extension BookResource {
    public enum Create {
        public struct Data: Codable {
            public let title: String
            public let bookTitle: String
            public let startPageNumber: Int
            public let endPageNumber: Int
            public let author: String
        }
    }
}
