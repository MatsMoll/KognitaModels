//
//  BookResource.swift
//  
//
//  Created by Mats Mollestad on 05/01/2021.
//

import Foundation

public struct BookResource: Equatable, Codable, ResourceRepresentable {
    public init(id: Int, title: String, bookTitle: String, startPageNumber: Int, endPageNumber: Int, author: String) {
        self.id = id
        self.title = title
        self.bookTitle = bookTitle
        self.startPageNumber = startPageNumber
        self.endPageNumber = endPageNumber
        self.author = author
    }
    
    public let id: Int
    public let title: String
    public let bookTitle: String
    public let startPageNumber: Int
    public let endPageNumber: Int
    public let author: String
    
    public var createContent: BookResource.Create.Data {
        BookResource.Create.Data(
            title: title,
            bookTitle: bookTitle,
            startPageNumber: startPageNumber,
            endPageNumber: endPageNumber,
            author: author
        )
    }
}

extension BookResource {
    public enum Create {
        public struct Data: Codable {
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
    }
}

extension BookResource {
    public struct Import: Equatable, Codable {
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
        
        public var createContent: BookResource.Create.Data {
            BookResource.Create.Data(
                title: title,
                bookTitle: bookTitle,
                startPageNumber: startPageNumber,
                endPageNumber: endPageNumber,
                author: author
            )
        }
    }
}
