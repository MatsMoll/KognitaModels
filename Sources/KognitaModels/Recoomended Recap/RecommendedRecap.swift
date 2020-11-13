//
//  RecommendedRecap.swift
//  KognitaModels
//
//  Created by Mats Mollestad on 07/10/2020.
//

import Foundation

/// A recommendation of what Kognita thinks the `User` will get the most value from
public struct RecommendedRecap: Codable {
    public init(subjectName: String, subjectID: Subject.ID, topicName: String, topicID: Int, resultScore: Double, revisitAt: Date) {
        self.subjectName = subjectName
        self.subjectID = subjectID
        self.topicName = topicName
        self.topicID = topicID
        self.resultScore = resultScore
        self.revisitAt = revisitAt
    }
    
    /// The subject name the recommendation is assosiated with
    public let subjectName: String
    
    /// The subject id the recommendatino is assosiated with
    public let subjectID: Subject.ID
    
    /// The name of the topic that is recommended to recap
    public let topicName: String
    
    /// The topic id
    public let topicID: Int
    
    /// The score the user has achived in the `Topic`
    public let resultScore: Double
    
    /// When it recommends to recap the `Topic`
    public let revisitAt: Date
}
