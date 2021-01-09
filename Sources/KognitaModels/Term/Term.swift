//
//  Term.swift
//  
//
//  Created by Mats Mollestad on 08/01/2021.
//

import Foundation

/// The content describing a `Term`
public struct Term: Codable, Identifiable {
    
    /// The id of the term
    public let id: Int
    
    /// The term it self
    public let term: String
    
    /// The meaning of the term
    public let meaning: String
    
    /// The id of the subtopic the term is related to
    public let subtopicID: Subtopic.ID
    
    /// When it was created at
    public let createdAt: Date
    
    /// When it was latest updated at
    public let updatedAt: Date
    
    public init(id: Int, term: String, meaning: String, subtopicID: Subtopic.ID, createdAt: Date, updatedAt: Date) {
        self.id = id
        self.term = term
        self.meaning = meaning
        self.subtopicID = subtopicID
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension Term {
    
    /// Structuring the create data
    public enum Create {
        
        /// The data needed to create a term
        public struct Data: Codable {
            
            /// The term it self
            public let term: String
            
            /// The meaning of the term
            public let meaning: String
            
            /// The id of the subtopic the term is related to
            public let subtopicID: Subtopic.ID
            
            public init(term: String, meaning: String, subtopicID: Subtopic.ID) {
                self.term = term
                self.meaning = meaning
                self.subtopicID = subtopicID
            }
        }
    }
    
    /// The content needed to import a Term
    public struct Import: Codable {
        
        /// The term it self
        public let term: String
        
        /// The meaning of the term
        public let meaning: String
        
        /// The source if any
        public let sources: [Resource.ID]?
        
        public init(term: String, meaning: String, sources: [Resource.ID]?) {
            self.term = term
            self.meaning = meaning
            self.sources = sources
        }
    }
}
